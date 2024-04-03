part of 'exams_schedule_period_cubit.dart';

abstract class NewSurveyState extends Equatable {
  const NewSurveyState();
}

class NewSurveyStateInitial extends NewSurveyState {
  @override
  List<Object> get props =>   [];
}
class NewSurveyStateLoading extends NewSurveyState {
  @override
  List<Object> get props => [];
}

class NewSurveyStateLoaded extends NewSurveyState {
 const NewSurveyStateLoaded({required this.model});
 final NewSurveyModel model;
  @override
  List<Object> get props => [model];
}class AnswerSurveyStateLoaded extends NewSurveyState {
 const AnswerSurveyStateLoaded({required this.model});
 final NewSurveyModel model;
  @override
  List<Object> get props => [model];
}


class NewSurveyStateError extends NewSurveyState {
 const NewSurveyStateError({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}



