
import 'package:poc_itg_survey/navigator/rules/conditional_navigation_rule.dart';
import 'package:poc_itg_survey/navigator/rules/direct_navigation_rule.dart';
import 'package:poc_itg_survey/navigator/task_navigator.dart';

import '../core/models/navigation_rule.dart';
import '../core/task/navigable_task.dart';
import '../core/task/task.dart';
import '../featuers/presentation/step/step.dart';
import '../featuers/data/model/question_result.dart';


class NavigableTaskNavigator extends TaskNavigator {
  NavigableTaskNavigator(Task task) : super(task);

  @override
  Step? nextStep({required Step step, QuestionResult? questionResult}) {
    record(step);
    final navigableTask = task as NavigableTask;
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
  Step? previousInList(Step? step) {
    if (history.isEmpty) {
      return null;
    }
    return history.removeLast();
  }

  Step? evaluateNextStep(Step? step, ConditionalNavigationRule rule,
      QuestionResult? questionResult) {
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

  @override
  Step? firstStep() {
    final previousStep = peekHistory();
    return previousStep == null
        ? task.initialStep ?? task.steps.first
        : nextStep(step: previousStep, questionResult: null);
  }
}
