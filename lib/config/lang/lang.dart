import 'package:flutter/material.dart';

enum LangType {
  id,
  en,
  defaults,
}

final Map<LangType, Locale> trinityLang = {
  LangType.id: const Locale('id', 'ID'),
  LangType.en: const Locale('en', 'US'),
};
