// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i13;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;
import 'package:trinity_wizard_test/config/api/api.dart' as _i11;
import 'package:trinity_wizard_test/config/api/dev_api.dart' as _i12;
import 'package:trinity_wizard_test/config/di/injector.dart' as _i15;
import 'package:trinity_wizard_test/config/router/router.dart' as _i4;
import 'package:trinity_wizard_test/core/lang/bloc/lang_bloc.dart' as _i8;
import 'package:trinity_wizard_test/core/utils/connection_util.dart' as _i7;
import 'package:trinity_wizard_test/core/utils/dio_interceptors_util.dart'
    as _i14;
import 'package:trinity_wizard_test/core/utils/error_util.dart' as _i5;
import 'package:trinity_wizard_test/core/utils/global_util.dart' as _i6;
import 'package:trinity_wizard_test/module/presentation/cubit/contact_cubit.dart'
    as _i3;

const String _dev = 'dev';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.ContactCubit>(() => _i3.ContactCubit());
    gh.singleton<_i4.AppRouter>(() => _i4.AppRouter());
    gh.lazySingleton<_i5.ErrorUtil>(() => _i5.ErrorUtil());
    gh.lazySingleton<_i6.GlobalUtil>(() => _i6.GlobalUtil());
    gh.lazySingleton<_i7.ConnectionUtil>(() => _i7.ConnectionUtil());
    gh.lazySingleton<_i8.LangBloc>(() => _i8.LangBloc());
    await gh.lazySingletonAsync<_i9.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i10.FlutterSecureStorage>(() => registerModule.storage);
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<_i11.TrinityApi>(
      () => _i12.DevNucleusApi(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i13.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.singleton<_i14.DioInterceptorsUtil>(
        () => _i14.DioInterceptorsUtil(gh<_i13.Dio>()));
    return this;
  }
}

class _$RegisterModule extends _i15.RegisterModule {}
