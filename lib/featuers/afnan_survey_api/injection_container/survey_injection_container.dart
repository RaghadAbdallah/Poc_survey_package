
import '../feature/data/data_source/new_survey_datasource.dart';
import '../feature/data/repositories/exams_schedule_period_repo_impl.dart';
import '../feature/domain/repository/exams_schedule_period_repositroy.dart';
import '../feature/domain/usecase/exams_schedule_period_usecase.dart';
import '../feature/domain/usecase/get_answer_survey_usecase.dart';
import '../feature/presentation/cubit/survey_cubit.dart';
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
