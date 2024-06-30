import 'package:flutter/foundation.dart';
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
}
