import 'package:dartz/dartz.dart';
  import '../../../core/domain/error/exceptions/exceptions.dart';
import '../../../core/domain/error/failures.dart';
import '../../domain/repository/exams_schedule_period_repositroy.dart';
 import '../data_source/new_survey_datasource.dart';
import '../model/new_survey_model.dart';

class NewSurveyRepositoryImpl
    implements NewSurveyRepository {
  NewSurveyRepositoryImpl({required this.dataSource});
  NewSurveyDataSourece dataSource;
  @override
  Future<Either<Failure, NewSurveyModel>> getNewSurvey() async {
    try {
      return Right(await dataSource.getNewSurvey());
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, NewSurveyModel>> getAnswerSurvey()
    async {
      try {
        return Right(await dataSource.getAnswerSurvey());
    } on ServerException {
    return const Left(ServerFailure());
    }
  }
}
