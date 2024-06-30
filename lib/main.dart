import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:trinity_wizard_test/module/presentation/ui/home_page.dart';

import 'config/api/api.dart';
import 'config/di/injector.dart';
import 'config/lang/lang.dart';
import 'config/router/router.dart';
import 'core/lang/bloc/lang_bloc.dart';
import 'core/utils/auto_route_observer_utils.dart';
import 'core/utils/bloc_observer_utils.dart';
import 'core/utils/connection_util.dart';
import 'core/utils/dio_interceptors_util.dart';
import 'core/utils/error_util.dart';
import 'core/utils/global_util.dart';
import 'core/utils/lang_util.dart';
import 'module/presentation/cubit/contact_cubit.dart';

Future<void> mainApp(String env) async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await configureInjector(env);

  HttpOverrides.global = MyHttpOverrides();

  debugPrint(env);

  final TrinityApi trinityApi = getIt<TrinityApi>();

  debugPrint(trinityApi.baseUrl());

  final GlobalUtil _globalUtil = getIt<GlobalUtil>();

  debugPrint = (String? message, {int? wrapWidth}) {};
  if (!kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) =>
        _globalUtil.debugPrintSynchronouslyWithText(
          message,
          '',
          wrapWidth: wrapWidth,
        );
  }

  // #Region Setup BlocObservers
  EquatableConfig.stringify = !kReleaseMode;

  Bloc.observer = BlocObserverUtils(
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory(),
    ),
  );

  runApp(const App());
}

//* App
class App extends StatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late dynamic _connectionChangeStream;
  final _appRouter = getIt<AppRouter>();
  final ErrorUtil _errorUtil = getIt<ErrorUtil>();

  @override
  void initState() {
    super.initState();
    debugPrint('InitState: $runtimeType');

    /// #Region Setup ConnectionUtil
    final ConnectionUtil _connectionUtil = getIt<ConnectionUtil>();
    _connectionUtil.initialize();

    // #Region Setup Dio
    final dio = getIt<Dio>();
    dio.interceptors.add(DioInterceptorsUtil(dio));

    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }
  }

  @override
  void dispose() {
    _connectionChangeStream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Build: $runtimeType');
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => getIt<LangBloc>(),
          ),
          BlocProvider(
            create: (_) => getIt<ContactCubit>(),
          )
        ],
        child: BlocBuilder<LangBloc, LangState>(
          builder: (
            BuildContext context,
            LangState lstate,
          ) {
            debugPrint('Locale: ${lstate.locale}');

            SystemChrome.setEnabledSystemUIMode(
              SystemUiMode.manual,
              overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
            );

            SystemChrome.setSystemUIOverlayStyle(
              SystemUiOverlayStyle(
                statusBarColor: Colors.green,
                // statusBarBrightness: activeTheme.brightness,
                // statusBarIconBrightness: activeTheme.brightness,
                // systemNavigationBarIconBrightness: activeTheme.brightness,
              ),
            );
            return ScreenUtilInit(
              designSize: const Size(360, 800),
              splitScreenMode: true,
              builder: (_, child) => MaterialApp.router(
                // routerDelegate: _appRouter.delegate(),
                // routeInformationParser: _appRouter.defaultRouteParser(),
                //supportedLocales: const [Locale('id', 'ID'), Locale('en', 'US')],
                routerConfig: _appRouter.config(
                  navigatorObservers: () => [
                    AutoRouteObserverUtils(),
                  ],
                ),
                key: _appRouter.key,

                supportedLocales:
                    trinityLang.entries.map((e) => e.value).toList(),
                localizationsDelegates: const [
                  LangUtilDelegate(),
                  FallbackCupertinoLocalisationsDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate
                ],
                title: TrinityApi.appName,
                locale: lstate.locale,
                debugShowCheckedModeBanner: false,
                theme: ThemeData.light(),
                builder: (BuildContext context, Widget? widget) {
                  ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
                    return _errorUtil.widgetError(context, errorDetails);
                  };

                  return MediaQuery(
                    //Setting font does not change with system font size
                    data: MediaQuery.of(context)
                        .copyWith(textScaler: const TextScaler.linear(1.0)),
                    child: widget!,
                  );
                },
              ),
            );
          },
        ));
  }
}

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const HomePage();
/*    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Template Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );*/
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
