import 'package:injectable/injectable.dart';

import '../di/injector.dart';
import 'api.dart';

@Environment(Env.dev)
@Injectable(as: TrinityApi)
class DevNucleusApi implements TrinityApi {
  @override
  String baseUrl() => "";

  @override
  String apiKey() => "";

  @override
  String oauthSecret() => "";

  @override
  String environment() => 'Development';
}
