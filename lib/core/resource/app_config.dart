import 'package:flutter/material.dart';

import '../../featuers/afnan_survey_api/feature/presentation/api_main_body.dart';
import '../../featuers/poc_survey_feature/presentation/json_main_body.dart';

enum Flavour {
  json,
  api,
}

class AppConfig {
  AppConfig();

  factory AppConfig._internal() => _shared;
  static final AppConfig _shared = AppConfig._internal();

  final Flavour _flavor = Flavour.api;

  Widget getReadDataFrom() {
    switch (_flavor) {
      case Flavour.json:
        return  JsonMainBody();
      case Flavour.api:
        return  ApiMainBody();
    }
  }
}
