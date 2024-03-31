part of 'survey_presenter_cubit.dart';

abstract class SurveyPresenterState extends Equatable {
  const SurveyPresenterState();
}

class SurveyPresenterInitial extends SurveyPresenterState {
  @override
  List<Object> get props => [];
}

///LoadingSurveyState
class SurveyPresenterLoading extends SurveyPresenterState {
  @override
  List<Object> get props => [];
}

///PresentingSurveyCleanState
class PresentingSurvey extends SurveyPresenterState {
  final ConfigAppBar appBarConfiguration;
  final List<StepClean> steps;
  final Set<InputQuestionResult> questionResults;
  final StepClean currentStep;
  final InputQuestionResult? result;
  final int currentStepIndex;
  final int stepCount;
  final bool isPreviousStep;

  const PresentingSurvey({
    required this.currentStep,
    required this.steps,
    required this.appBarConfiguration,
    required this.questionResults,
    this.result,
    this.currentStepIndex = 0,
    this.isPreviousStep = false,
    required this.stepCount});

  @override
  List<Object> get props => [currentStep,
    currentStepIndex,steps,appBarConfiguration,
    isPreviousStep,questionResults,stepCount];
}

///SurveyResultCleanState
class SurveyResult extends SurveyPresenterState {
  final SurveyResultClean result;
  final StepClean? currentStep;
  final InputQuestionResult? stepResult;

  const SurveyResult({required this.result,
    required this.currentStep,
    this.stepResult});

  @override
  List<Object> get props => [result];
}
