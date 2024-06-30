// ignore_for_file: must_be_immutable

part of 'lang_bloc.dart';

abstract class LangEvent extends Equatable {
  const LangEvent();

  @override
  List<Object> get props => [];
}

class SwitchEv extends LangEvent {
  SwitchEv({
    required this.langType,
    this.isUseDefaultLang = true,
  });

  final LangType langType;
  bool? isUseDefaultLang;

  @override
  String toString() => 'LangEvent.SwitchEv';

  @override
  List<Object> get props => [langType];
}
