// ignore_for_file: must_be_immutable

part of 'lang_bloc.dart';

class LangState extends Equatable {
  LangState({
    required this.locale,
    this.isUseDefaultLang = true,
  });

  Locale locale;
  bool isUseDefaultLang = true;

  @override
  List<Object> get props => [locale, isUseDefaultLang];
}
