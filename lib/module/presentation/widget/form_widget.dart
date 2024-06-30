import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trinity_wizard_test/config/theme/theme.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    Key? key,
    required this.formCtr,
    this.isEnabled = true,
    this.isUseSuffix = false,
  }) : super(key: key);

  final TextEditingController formCtr;
  final bool? isEnabled;
  final bool? isUseSuffix;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      width: 0.7.sw,
      child: TextFormField(
          enabled: isEnabled,
          autofocus: false,
          enableSuggestions: false,
          autocorrect: false,
          controller: formCtr,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(12.r),
            errorMaxLines: 2,
            suffixIcon: isUseSuffix!
                ? const Icon(
                    Icons.date_range_outlined,
                  )
                : null,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black45,
                width: 1,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black45,
                width: 1,
              ),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black45,
                width: 1,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: TrinityColor.primaryColor,
                width: 1,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 1,
              ),
            ),
          ),
          onChanged: (value) {},
          validator: (value) {
            if (value!.isEmpty) {
              return 'Field is required';
            }
            return '';
          }),
    );
  }
}
