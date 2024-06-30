import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/lang/lang.dart';

part 'lang_event.dart';
part 'lang_state.dart';

@lazySingleton
class LangBloc extends HydratedBloc<LangEvent, LangState> {
  LangBloc()
      : super(
          LangState(locale: trinityLang[LangType.id]!),
        ) {
    on<SwitchEv>((event, emit) async {
      if (event.isUseDefaultLang!) {
        emit(
          LangState(locale: trinityLang[event.langType]!),
        );
      } else {
        emit(
          LangState(
            isUseDefaultLang: false,
            locale: trinityLang[event.langType]!,
          ),
        );
      }
    });
  }

  @override
  LangState fromJson(Map<String, dynamic> json) {
    return LangState(
      locale: _mapStringToData(json['langType'].toString()),
    );
  }

  @override
  Map<String, dynamic> toJson(LangState state) {
    return {
      'langType': _mapDataToString(state.locale),
    };
  }

  Locale _mapStringToData(String langType) {
    if (langType == 'LangType.id') {
      return trinityLang[LangType.id]!;
    } else {
      return trinityLang[LangType.en]!;
    }
  }

  String _mapDataToString(Locale locale) {
    if (locale == trinityLang[LangType.id]) {
      return 'LangType.id';
    } else {
      return 'LangType.en';
    }
  }
}
