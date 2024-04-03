import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'survey_injection_container.dart';


GetIt sl = GetIt.instance;

Future<void> initDI() async {
  await initNewSurvey();

  // external
  sl.registerLazySingleton(() => Dio());
}
