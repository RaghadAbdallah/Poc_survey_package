

import 'package:poc_itg_survey/navigator/task_navigator.dart';

import '../core/task/task.dart';
import '../featuers/data/model/question_result.dart';
import '../featuers/presentation/step/step.dart';

class OrderedTaskNavigator extends TaskNavigator {
  OrderedTaskNavigator(Task task) : super(task);

  @override
  Step? nextStep({required Step step, QuestionResult? questionResult}) {
    record(step);
    return nextInList(step);
  }

  @override
  Step? previousInList(Step step) {
    final currentIndex = task.steps
        .indexWhere((element) => element.stepIdentifier == step.stepIdentifier);
    return (currentIndex - 1 < 0) ? null : task.steps[currentIndex - 1];
  }

  @override
  Step? firstStep() {
    final previousStep = peekHistory();
    return previousStep == null
        ? task.initialStep ?? task.steps.first
        : nextInList(previousStep);
  }
}
