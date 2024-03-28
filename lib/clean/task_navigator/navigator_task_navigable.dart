import 'package:poc_itg_survey/clean/model/input_format_model/input_answer_model.dart';
import 'package:poc_itg_survey/clean/presentation/widget/steps_clean.dart';
import 'package:poc_itg_survey/clean/presentation/widget/task_clean.dart';
import 'package:poc_itg_survey/clean/task_navigator/task_navigator.dart';
import 'package:poc_itg_survey/core/models/navigation_rule.dart';
import 'package:poc_itg_survey/navigator/rules/conditional_navigation_rule.dart';
import 'package:poc_itg_survey/navigator/rules/direct_navigation_rule.dart';

import '../presentation/widget/navigable_task_clean.dart';

class NavigableTaskNavigator extends TaskNavigatorClean {
  NavigableTaskNavigator(TaskClean task) : super(task);

  @override
  StepClean? firstStep() {
    final previousStep = peekHistory();
    return previousStep == null
        ? task.initialStep ?? task.steps.first
        : nextStep(step: previousStep, questionResult: null);
  }

  @override
  StepClean? nextStep({required StepClean step, InputQuestionResult? questionResult}) {
    record(step);
    final navigableTask = task as NavigableTaskClean;
    NavigationRule? rule =
    navigableTask.getRuleByStepIdentifier(step.stepIdentifier);
    if (rule == null) {
      return nextInList(step);
    }
    switch (rule.runtimeType) {
      case DirectNavigationRule:
        return task.steps.firstWhere((element) =>
        element.stepIdentifier ==
            (rule as DirectNavigationRule).destinationStepIdentifier);
      case ConditionalNavigationRule:
        return evaluateNextStep(
            step, rule as ConditionalNavigationRule, questionResult);
    }
    return nextInList(step);
  }

  @override
  StepClean? previousInList(StepClean step) {
    if (history.isEmpty) {
      return null;
    }
    return history.removeLast();
  }

  StepClean? evaluateNextStep(StepClean? step, ConditionalNavigationRule rule,
      InputQuestionResult? questionResult) {
    if (questionResult == null) {
      return nextInList(step);
    }
    final result = questionResult.result;
    if (result == null) {
      return nextInList(step);
    }
    final nextStepIdentifier =
    rule.resultToStepIdentifierMapper(questionResult.valueIdentifier);
    if (nextStepIdentifier == null) {
      return nextInList(step);
    }
    return task.steps
        .firstWhere((element) => element.stepIdentifier == nextStepIdentifier);
  }
}