

import 'package:poc_itg_survey/core/resource/task_navigator/task_navigator.dart';

import '../../../featuers/poc_survey_feature/data/model/input_format_model/input_answer_model.dart';
import '../../../featuers/poc_survey_feature/presentation/widget/steps_clean/steps_clean.dart';
import '../../../featuers/poc_survey_feature/presentation/widget/task_clean.dart';
class OrderedTaskNavigator extends TaskNavigatorClean {
  OrderedTaskNavigator(TaskClean task) : super(task);

  @override
  StepClean? firstStep() {
    final previousStep = peekHistory();
    return previousStep == null
        ? task.initialStep ?? task.steps.first
        : nextInList(previousStep);
  }


  @override
  StepClean? previousInList(StepClean step) {
    final currentIndex = task.steps
        .indexWhere((element) => element.stepIdentifier == step.stepIdentifier);
    return (currentIndex - 1 < 0) ? null : task.steps[currentIndex - 1];
  }

  @override
  StepClean? nextStep({required StepClean step, InputQuestionResult? questionResult}) {
    record(step);
    return nextInList(step);
  }}