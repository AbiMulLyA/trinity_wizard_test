// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

enum ErrorType {
  noInternet,
  noResponse,
  responseInvalid,
  requestFailed,
  systemOffline,
  unKnownError,
  timeoutError,
  authError,
  sessionError,
  serverError,
  backendError,
  dtoParsingError,
}

@lazySingleton
class ErrorUtil {
  // final _bottomSheet = getIt<InfoBottomSheetComponent>();
  // final _globalUtil = getIt<GlobalUtil>();

  //* Error Handling Widget
  Widget widgetError(BuildContext context, FlutterErrorDetails? error) {
    return Scaffold(
      body: Container(
        color: Colors.redAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Error Widget.",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
            ),
            Center(
              child: Text(
                '${error?.summary ?? ''}',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
