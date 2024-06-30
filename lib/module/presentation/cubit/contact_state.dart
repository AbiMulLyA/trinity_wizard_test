part of 'contact_cubit.dart';

@freezed
class ContactState with _$ContactState {
  const factory ContactState.initial() = _Initial;
  const factory ContactState.loading() = _Loading;
  const factory ContactState.success({
    required List<Map<String, String>> data,
  }) = _Success;
}
