
import '../featuers/cubit/exams_schedule_period_cubit.dart';
import '../featuers/poc_survey_feature/data/data_source/new_survey_datasource.dart';
import '../featuers/poc_survey_feature/data/repositories/exams_schedule_period_repo_impl.dart';
import '../featuers/poc_survey_feature/domain/repository/exams_schedule_period_repositroy.dart';
import '../featuers/poc_survey_feature/domain/usecase/exams_schedule_period_usecase.dart';
import '../featuers/poc_survey_feature/domain/usecase/get_answer_survey_usecase.dart';
import 'injection_container.dart';

Future<void> initNewSurvey() async {
  // cubit
  sl.registerFactory(() => NewSurveyCubit(
      newSurveyUseCase: sl<NewSurveyUseCase>(), answerSurveyUseCase: sl()));

  // repository
  sl.registerLazySingleton<NewSurveyRepository>(() =>
      NewSurveyRepositoryImpl(
          dataSource: sl<NewSurveyDataSourece>()));
//datasource
   sl.registerLazySingleton<NewSurveyDataSourece>(
      () => NewSurveyDataSoureceImpl());

  // use cases
  sl.registerLazySingleton(() => NewSurveyUseCase(repository: sl()));
  sl.registerLazySingleton(() => AnswerSurveyUseCase(repository: sl()));
}
