

import '../../../core/widget/config_app_bar.dart';
import '../../../core/models/itg_survey_result.dart';
import '../../data/model/question_result.dart';
import '../step/step.dart';

abstract class SurveyState {
  const SurveyState();
}

class LoadingSurveyState extends SurveyState {}

class PresentingSurveyState extends SurveyState {
  final ConfigAppBar appBarConfiguration;
  final List<Step> steps;
  final Set<QuestionResult> questionResults;
  final Step currentStep;
  final QuestionResult? result;
  final int currentStepIndex;
  final int stepCount;
  final bool isPreviousStep;

  PresentingSurveyState({
    required this.stepCount,
    required this.appBarConfiguration,
    required this.currentStep,
    required this.steps,
    required this.questionResults,
    this.result,
    this.currentStepIndex = 0,
    this.isPreviousStep = false,
  });
}

class SurveyResultState extends SurveyState {
  final SurveyResult result;
  final Step? currentStep;
  final QuestionResult? stepResult;

  SurveyResultState({
    required this.result,
    this.stepResult,
    required this.currentStep,
  });
}
