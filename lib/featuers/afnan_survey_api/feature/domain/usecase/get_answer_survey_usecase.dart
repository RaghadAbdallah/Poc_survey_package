import 'package:dartz/dartz.dart';
  import '../../../core/domain/error/failures.dart';
import '../../../core/domain/usecases/usecase.dart';
import '../../data/model/new_survey_model.dart';
import '../repository/exams_schedule_period_repositroy.dart';
 class AnswerSurveyUseCase
    implements UseCase<NewSurveyModel, NoParams> {

  AnswerSurveyUseCase({required this.repository});
  NewSurveyRepository repository;

  @override
  Future<Either<Failure, NewSurveyModel>> call(
      NoParams params)  {
    return  repository.getAnswerSurvey();
  }
}
