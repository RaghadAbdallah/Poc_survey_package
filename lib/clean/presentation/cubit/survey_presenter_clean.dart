import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_itg_survey/clean/presentation/widget/steps_clean/steps_clean.dart';
import 'package:poc_itg_survey/clean/presentation/widget/steps_clean/steps_result_clean.dart';
import 'package:poc_itg_survey/clean/presentation/cubit/survey_event_clean.dart';
import 'package:poc_itg_survey/clean/presentation/widget/survey_result_clean.dart';
import 'package:poc_itg_survey/clean/presentation/cubit/survey_state_clean.dart';
import 'package:poc_itg_survey/clean/task_navigator/task_navigator.dart';
import 'package:poc_itg_survey/featuers/presentation/bloc/survey_event.dart';
import 'package:poc_itg_survey/featuers/presentation/step/step.dart';
import '../../../core/widget/config_app_bar.dart';
import '../../../featuers/presentation/step/step_identifer.dart';
import '../../model/input_format_model/input_answer_model.dart';

class SurveyPresenterClean extends Bloc<SurveyEventClean, SurveyStateClean> {
  final TaskNavigatorClean taskNavigator;
  final Function(SurveyResultClean) onResult;

  Set<InputQuestionResult> results = {};
  late final DateTime startDate;

  SurveyPresenterClean({
    required this.taskNavigator,
    required this.onResult,
  }) : super(LoadingSurveyState()) {

    on<StartSurveyClean>((event, emit){
      emit(
          _handleInitialStep()
      );
    });

    on<NextStepClean>((event, emit){
      if (state is PresentingSurveyCleanState){
        emit(_handleNextStep(event, state as PresentingSurveyCleanState));
      }
    });

    on<StepBackClean>((event, emit){
      if (state is PresentingSurveyCleanState){
        emit(
            _handleStepBack(event, state as PresentingSurveyCleanState)
        );
      }
    });

    on<CloseSurveyClean>((event, emit){
      if (state is PresentingSurveyCleanState){
        emit(
            _handleClose(event, state as PresentingSurveyCleanState)
        );
      }
    });

    this.startDate = DateTime.now();
    add(StartSurveyClean());
  }


  SurveyStateClean _handleInitialStep() {
    StepClean? step = taskNavigator.firstStep();
    if (step != null) {
      return PresentingSurveyCleanState(
        currentStep: step,
        questionResults: results,
        steps: taskNavigator.task.steps,
        result: null,
        currentStepIndex: currentStepIndex(step),
        stepCount: countSteps,
        appBarConfiguration: ConfigAppBar(
          showProgress: step.showProgress,
          canBack: step.canGoBack,
        ),
      );
    }

    //If not steps are provided we finish the survey
    final taskResult = SurveyResultClean(
      id: taskNavigator.task.id,
      startDate: startDate,
      endDate: DateTime.now(),
      finishReason: FinishReason.COMPLETED,
      results: [],
    );
    return SurveyResultCleanState(
      result: taskResult,
      currentStep: null,
    );
  }

  SurveyStateClean _handleNextStep(
      NextStepClean event, PresentingSurveyCleanState currentState) {
    _addResult(event.questionResult);
    final StepClean? nextStep = taskNavigator.nextStep(
        step: currentState.currentStep, questionResult: event.questionResult);

    if (nextStep == null) {
      return _handleSurveyFinished(currentState);
    }

    InputQuestionResult? questionResult =
    _getResultByStepIdentifier(nextStep.stepIdentifier);

    return PresentingSurveyCleanState(
      currentStep: nextStep,
      result: questionResult,
      steps: taskNavigator.task.steps,
      questionResults: results,
      currentStepIndex: currentStepIndex(nextStep),
      stepCount: countSteps,
      appBarConfiguration: ConfigAppBar(
        showProgress: nextStep.showProgress,
        canBack: nextStep.canGoBack,
      ),
    );
  }

  SurveyStateClean _handleStepBack(
      StepBackClean event, PresentingSurveyCleanState currentState) {
    _addResult(event.questionResult);
    final StepClean? previousStep =
    taskNavigator.previousInList(currentState.currentStep);

    if (previousStep != null) {
      InputQuestionResult? questionResult =
      _getResultByStepIdentifier(previousStep.stepIdentifier);

      return PresentingSurveyCleanState(
        currentStep: previousStep,
        result: questionResult,
        steps: taskNavigator.task.steps,
        questionResults: results,
        currentStepIndex: currentStepIndex(previousStep),
        appBarConfiguration: ConfigAppBar(
          showProgress: previousStep.showProgress,
          canBack: previousStep.canGoBack,
        ),
        isPreviousStep: true,
        stepCount: countSteps,
      );
    }

    //If theres no previous step we can't go back further
    return state;
  }

  InputQuestionResult? _getResultByStepIdentifier(StepIdentifier? identifier) {
    return results.firstWhereOrNull(
          (element) => element.id == identifier,
    );
  }

  SurveyStateClean _handleClose(
      CloseSurveyClean event, PresentingSurveyCleanState currentState) {
    _addResult(event.questionResult);

    List<StepResultClean> stepResults =
    results.map((e) => StepResultClean.fromQuestion(questionResult: e)).toList();

    final taskResult = SurveyResultClean(
      id: taskNavigator.task.id,
      startDate: startDate,
      endDate: DateTime.now(),
      finishReason: FinishReason.DISCARDED,
      results: stepResults,
    );
    return SurveyResultCleanState(
      result: taskResult,
      stepResult: currentState.result,
      currentStep: currentState.currentStep,
    );
  }

  //Currently we are only handling one question per step
  SurveyStateClean _handleSurveyFinished(PresentingSurveyCleanState currentState) {
    List<StepResultClean> stepResults =
    results.map((e) => StepResultClean.fromQuestion(questionResult: e)).toList();
    final taskResult = SurveyResultClean(
      id: taskNavigator.task.id,
      startDate: startDate,
      endDate: DateTime.now(),
      finishReason: FinishReason.COMPLETED,
      results: stepResults,
    );
    return SurveyResultCleanState(
      result: taskResult,
      currentStep: currentState.currentStep,
      stepResult: currentState.result,
    );
  }

  void _addResult(InputQuestionResult? questionResult) {
    if (questionResult == null) {
      return;
    }
    results
        .removeWhere((InputQuestionResult result) => result.id == questionResult.id);
    results.add(
      questionResult,
    );
  }

  int get countSteps => taskNavigator.countSteps;
  int currentStepIndex(StepClean step) {
    return taskNavigator.currentStepIndex(step);
  }
}