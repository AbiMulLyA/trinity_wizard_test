import 'package:equatable/equatable.dart';

import '../utils/error_util.dart';

abstract class Failure extends Equatable {
  const Failure({
    required this.message,
    required this.type,
  });

  final String message;
  final dynamic type;

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;
}

//* RemoteFailure
class RemoteFailure extends Failure {
  const RemoteFailure({
    required String message,
    required dynamic type,
  }) : super(
          message: message,
          type: type,
        );
}

//* NoInternetFailure
class NoInternetFailure extends Failure {
  const NoInternetFailure()
      : super(
          message: 'No Internet',
          type: ErrorType.noInternet,
        );
}
