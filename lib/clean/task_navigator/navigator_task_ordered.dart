import 'package:poc_itg_survey/clean/model/input_format_model/input_answer_model.dart';
import 'package:poc_itg_survey/clean/presentation/widget/steps_clean/steps_clean.dart';
import 'package:poc_itg_survey/clean/presentation/widget/task_clean.dart';
import 'package:poc_itg_survey/clean/task_navigator/task_navigator.dart';
import 'package:poc_itg_survey/core/task/task.dart';
import 'package:poc_itg_survey/featuers/presentation/step/step.dart';

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