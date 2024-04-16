import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/domain/error/failures.dart';
import '../../../core/domain/usecases/usecase.dart';
import '../../data/model/new_survey_model.dart';
import '../../domain/usecase/exams_schedule_period_usecase.dart';
import '../../domain/usecase/get_answer_survey_usecase.dart';

part 'survey_state.dart';

class NewSurveyCubit extends Cubit<NewSurveyState> {
  NewSurveyCubit(
      { required this.answerSurveyUseCase, required this.newSurveyUseCase})
      : super(NewSurveyStateInitial());
 NewSurveyUseCase newSurveyUseCase;
  AnswerSurveyUseCase answerSurveyUseCase;
  List<int> checkData = [];

  Future<dynamic> getSurveyData() async {
    emit(NewSurveyStateLoading());
    final Either<Failure, NewSurveyModel> eitherInput =
        await newSurveyUseCase.call(NoParams());
    eitherInput.fold(
        (Failure failure) =>
            emit(NewSurveyStateError(message: failure.message ?? '')),
        (NewSurveyModel success) {
      newSurveyDat = success;

      emit(NewSurveyStateLoaded(model: success));
    });
  }

  Future<dynamic> getAnswerSurveyData() async {
    emit(NewSurveyStateLoading());
    final Either<Failure, NewSurveyModel> eitherInput =
        await answerSurveyUseCase.call(NoParams());
    eitherInput.fold(
        (Failure failure) =>
            emit(NewSurveyStateError(message: failure.message ?? '')),
        (NewSurveyModel success) {
      newSurveyDat = success;

      emit(AnswerSurveyStateLoaded(model: success));
    });
  }
  NewSurveyModel? newSurveyDat;
}
