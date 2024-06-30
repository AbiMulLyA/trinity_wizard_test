import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@lazySingleton
class GlobalUtil {
  //* debugPrintSynchronouslyWithText
  void debugPrintSynchronouslyWithText(String? message, String? version,
      {int? wrapWidth}) {
    final dateToday = DateFormat.yMd().add_Hms().format(DateTime.now());
    message = "[$dateToday]: $message";
    debugPrintSynchronously(message, wrapWidth: wrapWidth);
  }

  Future<T?> showSlidingSheet<T>(
    BuildContext context, {
    Widget? header,
    Widget? content,
    Widget? footer,
  }) {
    return showModalBottomSheet(
      context: context,
      enableDrag: false,
      isDismissible: true,
      showDragHandle: false,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: IntrinsicHeight(
            child: Container(
              constraints: BoxConstraints(maxHeight: 0.95.sh),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    header ?? const SizedBox(),
                    content != null
                        ? Container(
                            constraints: BoxConstraints(maxHeight: 0.80.sh),
                            child: SingleChildScrollView(
                              child: content,
                            ),
                          )
                        : const SizedBox.shrink(),
                    Container(
                      margin: EdgeInsets.only(bottom: 18.r),
                      child: footer ?? const SizedBox(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
