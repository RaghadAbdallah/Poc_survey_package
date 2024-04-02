import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/domain/error/failures.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../poc_survey_feature/data/model/new_survey_model.dart';
import '../poc_survey_feature/domain/usecase/exams_schedule_period_usecase.dart';
part 'exams_schedule_period_state.dart';

class NewSurveyCubit extends Cubit<NewSurveyState> {
  NewSurveyCubit({required this.newSurveyUseCase})
      : super(NewSurveyStateInitial());
  NewSurveyUseCase newSurveyUseCase;
  List<int> checkData = [];

  Future<dynamic> geSurveyData() async {
    emit(NewSurveyStateLoading());
    final Either<Failure, NewSurveyModel> eitherInput = await newSurveyUseCase.call(NoParams());
    eitherInput.fold(
        (Failure failure) =>
            emit(NewSurveyStateError(message: failure.message ?? '')),
        (NewSurveyModel success){
          newSurveyDat=success;

          emit(NewSurveyStateLoaded(


            model: success));});
  }

  NewSurveyModel? newSurveyDat;

}