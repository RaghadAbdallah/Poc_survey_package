import 'package:dartz/dartz.dart';
import '../../../../core/domain/error/failures.dart';
import '../../data/model/new_survey_model.dart';

abstract class NewSurveyRepository {
  Future<Either<Failure, NewSurveyModel>> getNewSurvey();
  Future<Either<Failure, NewSurveyModel>> getAnswerSurvey();
}
