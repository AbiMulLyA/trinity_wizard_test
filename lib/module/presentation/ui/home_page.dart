import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:trinity_wizard_test/config/router/router.dart';
import 'package:trinity_wizard_test/config/theme/theme.dart';
import 'package:trinity_wizard_test/module/presentation/cubit/contact_cubit.dart';

import '../../data/datasource/local/ContactData.dart';
import '../widget/pull_refresh_widget.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _refreshController =
        useMemoized(() => RefreshController(initialRefresh: false));

    useEffect(() {
      context.read<ContactCubit>().getDataContact();

      return () {};
    }, const []);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Contacts',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.search,
            color: TrinityColor.primaryColor,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              final _detailPage = await context.pushRoute(DetailContactRoute());
              if (_detailPage != null) {
                context.read<ContactCubit>().getDataContact();
              }
            },
            child: const Icon(
              Icons.add,
              color: TrinityColor.primaryColor,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
        ],
      ),
      body: BlocBuilder<ContactCubit, ContactState>(
        builder: (context, state) => state.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            success: (data) {
              _refreshController.refreshCompleted();
              return Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                  left: 16.r,
                  top: 16.r,
                  right: 16.r,
                ),
                child: PullRefreshComponent(
                  controller: _refreshController,
                  onRefresh: () {
                    context.read<ContactCubit>().getDataContact();
                  },
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                    ),
                    itemCount: ContactData.dataContact.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context.pushRoute(
                            DetailContactRoute(
                                firstName: data[index]['firstName']!,
                                lastName: data[index]['firstName']!,
                                email: data[index]['email']!,
                                dob: data[index]['dob']!),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black12,
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 55.w,
                                  height: 60.h,
                                  decoration: BoxDecoration(
                                    color: TrinityColor.primaryColor,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  '${data[index]['firstName']!} ${data[index]['lastName']!}',
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }),
      ),
    );
  }
}
