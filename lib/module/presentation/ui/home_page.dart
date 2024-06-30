import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trinity_wizard_test/config/theme/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            onTap: () {},
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
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
          left: 16.r,
          top: 16.r,
          right: 16.r,
        ),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
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
                    const Text(('Phoebe Monroe'))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
