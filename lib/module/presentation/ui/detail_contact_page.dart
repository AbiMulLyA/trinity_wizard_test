import 'package:auto_route/auto_route.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:trinity_wizard_test/config/theme/theme.dart';
import 'package:trinity_wizard_test/core/utils/global_util.dart';
import 'package:trinity_wizard_test/module/presentation/widget/form_widget.dart';

import '../../../config/di/injector.dart';

@RoutePage()
class DetailContactPage extends HookWidget {
  const DetailContactPage({
    Key? key,
    this.firstName,
    this.lastName,
    this.email,
    this.dob,
  }) : super(key: key);

  final String? firstName;
  final String? lastName;
  final String? email;
  final String? dob;

  @override
  Widget build(BuildContext context) {
    final _firstNameCtr = useTextEditingController();
    final _lastNameCtr = useTextEditingController();
    final _emailCtr = useTextEditingController();
    final _dobCtr = useTextEditingController();

    final _globalUtil = useMemoized(() => getIt<GlobalUtil>());

    useEffect(() {
      _firstNameCtr.text = firstName ?? '';
      _lastNameCtr.text = lastName ?? '';
      _emailCtr.text = email ?? '';
      _dobCtr.text = dob ?? '';

      return () {};
    }, const []);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            context.maybePop();
          },
          child: Center(
            child: Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                const Text(
                  'Cancel',
                  style: TextStyle(
                    color: TrinityColor.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Center(
              child: Text(
                'Save',
                style: TextStyle(
                  color: TrinityColor.primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: 1.sh,
          padding: EdgeInsets.all(
            10.r,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  width: 55.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: TrinityColor.primaryColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: 1.sw,
                  color: Colors.grey.shade50,
                  padding: EdgeInsets.only(top: 10.r, bottom: 10.r),
                  child: const Text(
                    'Main Information',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Divider(
                  height: 1.h,
                  thickness: 0.1.r,
                  color: Colors.black45,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 90.h,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          const Text(
                            'First Name',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    FormWidget(formCtr: _firstNameCtr),
                  ],
                ),
                Divider(
                  height: 1.h,
                  thickness: 0.1.r,
                  color: Colors.black45,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 90.h,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          const Text(
                            'Last Name',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    FormWidget(formCtr: _lastNameCtr),
                  ],
                ),
                Divider(
                  height: 1.h,
                  thickness: 0.1.r,
                  color: Colors.black45,
                ),
                Container(
                  width: 1.sw,
                  color: Colors.grey.shade50,
                  padding: EdgeInsets.only(top: 10.r, bottom: 10.r),
                  child: const Text(
                    'Main Information',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 90.h,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          const Text(
                            'Email',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 40.w,
                    ),
                    FormWidget(formCtr: _emailCtr),
                  ],
                ),
                Divider(
                  height: 1.h,
                  thickness: 0.1.r,
                  color: Colors.black45,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 90.h,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          const Text(
                            'DOB',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 48.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        _globalUtil.showSlidingSheet(context,
                            // height: 0.5.sh,
                            header: const Text('Select Data'),
                            content: Material(
                              child: SizedBox(
                                height: 0.5.sh,
                                child: CalendarDatePicker2WithActionButtons(
                                  value: [
                                    DateFormat('dd/MM/yyyy').parse(
                                      '30/06/2024',
                                    ),
                                  ],
                                  onCancelTapped: () {
                                    Navigator.pop(context);
                                  },
                                  onOkTapped: () {
                                    Navigator.pop(context);
                                  },
                                  onValueChanged: (value) {
                                    debugPrint(
                                        'Date Value : $value -- ${DateFormat('dd/MM/yyyy').format(DateTime.parse(value[0].toString()))}');

                                    _dobCtr.text =
                                        DateFormat('dd/MM/yyyy').format(
                                      DateTime.parse(
                                        value[0].toString(),
                                      ),
                                    );
                                  },
                                  config:
                                      CalendarDatePicker2WithActionButtonsConfig(
                                    currentDate: DateFormat('dd/MM/yyyy').parse(
                                      '30/06/2024',
                                    ),
                                    selectedDayHighlightColor: Colors.blue,
                                    disabledDayTextStyle:
                                        const TextStyle(color: Colors.black26),
                                    selectedDayTextStyle:
                                        const TextStyle(color: Colors.white),
                                    selectedYearTextStyle:
                                        const TextStyle(color: Colors.white),
                                    okButtonTextStyle:
                                        const TextStyle(color: Colors.blue),
                                    cancelButtonTextStyle: const TextStyle(
                                      color: Colors.blue,
                                    ),
                                    lastMonthIcon: const Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.black,
                                    ),
                                    nextMonthIcon: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black,
                                    ),
                                    weekdayLabels: [
                                      'M',
                                      'S',
                                      'S',
                                      'R',
                                      'K',
                                      'J',
                                      'S',
                                    ],
                                    okButton: const Text(
                                      'Save',
                                      style: TextStyle(
                                          color: TrinityColor.primaryColor),
                                    ),
                                    cancelButton: const Text(
                                      'Cancel',
                                      style: TextStyle(
                                          color: TrinityColor.primaryColor),
                                    ),
                                    closeDialogOnCancelTapped: true,
                                    closeDialogOnOkTapped: true,
                                  ),
                                ),
                              ),
                            ));
                      },
                      child: FormWidget(
                        formCtr: _dobCtr,
                        isEnabled: false,
                        isUseSuffix: true,
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 1.h,
                  thickness: 0.1.r,
                  color: Colors.black45,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
