import 'package:flutter/foundation.dart';

import 'config/di/injector.dart';
import 'main.dart';

Future<void> main() async {
  debugPrint('ENV:::::::${Env.dev}');
  await mainApp(Env.dev);
}
