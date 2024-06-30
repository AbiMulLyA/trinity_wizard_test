import 'package:injectable/injectable.dart';

@factoryMethod
abstract class TrinityApi {
  static const String appName = "Trinity Wizard Test";
  static const String scopeInjectionCore = "core";

  static const int defApiTimeout = 20; //in seconds
  static const int defFetchLimit = 10;

  String baseUrl();

  String apiKey();

  String oauthSecret();

  String environment();
}
