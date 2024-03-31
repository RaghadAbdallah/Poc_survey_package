import 'package:poc_itg_survey/clean/presentation/widget/steps_clean/steps_clean.dart';
import 'package:poc_itg_survey/clean/presentation/widget/survey_result_clean.dart';
import 'package:poc_itg_survey/core/models/itg_survey_result.dart';
import 'package:poc_itg_survey/featuers/presentation/step/step.dart';

import '../../../core/widget/config_app_bar.dart';
import '../../model/input_format_model/input_answer_model.dart';

abstract class SurveyStateClean {
  const SurveyStateClean();
}

class LoadingSurveyState extends SurveyStateClean {}

class PresentingSurveyCleanState extends SurveyStateClean {
  final ConfigAppBar appBarConfiguration;
  final List<StepClean> steps;
  final Set<InputQuestionResult> questionResults;
  final StepClean currentStep;
  final InputQuestionResult? result;
  final int currentStepIndex;
  final int stepCount;
  final bool isPreviousStep;

  PresentingSurveyCleanState({
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

class SurveyResultCleanState extends SurveyStateClean {
  final SurveyResultClean result;
  final StepClean? currentStep;
  final InputQuestionResult? stepResult;

  SurveyResultCleanState({
    required this.result,
    this.stepResult,
    required this.currentStep,
  });
}