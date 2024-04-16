//
//
// import '../../../../core/widget/config_app_bar.dart';
// import '../../data/model/input_answer_model.dart';
// import '../widget/steps_clean/steps_clean.dart';
// import '../../data/model/survey_result_clean.dart';
//
// abstract class SurveyStateClean {
//   const SurveyStateClean();
// }
//
// class LoadingSurveyState extends SurveyStateClean {}
//
// class PresentingSurveyCleanState extends SurveyStateClean {
//   final ConfigAppBar appBarConfiguration;
//   final List<StepClean> steps;
//   final Set<InputQuestionResult> questionResults;
//   final StepClean currentStep;
//   final InputQuestionResult? result;
//   final int currentStepIndex;
//   final int stepCount;
//   final bool isPreviousStep;
//
//   PresentingSurveyCleanState({
//     required this.stepCount,
//     required this.appBarConfiguration,
//     required this.currentStep,
//     required this.steps,
//     required this.questionResults,
//     this.result,
//     this.currentStepIndex = 0,
//     this.isPreviousStep = false,
//   });
// }
//
// class SurveyResultCleanState extends SurveyStateClean {
//   final SurveyResultClean result;
//   final StepClean? currentStep;
//   final InputQuestionResult? stepResult;
//
//   SurveyResultCleanState({
//     required this.result,
//     this.stepResult,
//     required this.currentStep,
//   });
// }