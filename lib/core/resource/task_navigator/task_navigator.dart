import 'dart:collection';

import '../../../featuers/poc_survey_feature/data/model/input_format_model/input_answer_model.dart';
import '../../../featuers/poc_survey_feature/presentation/widget/steps_clean/steps_clean.dart';
import '../../../featuers/poc_survey_feature/presentation/widget/task_clean.dart';

abstract class TaskNavigatorClean {
  final TaskClean task;
  final ListQueue<StepClean> history = ListQueue();

  TaskNavigatorClean(this.task);

  StepClean? firstStep();
  StepClean? nextStep({required StepClean step, InputQuestionResult? questionResult});
  StepClean? previousInList(StepClean step);

  StepClean? nextInList(StepClean? step) {
    final currentIndex = task.steps.indexWhere(
            (element) => element.stepIdentifier == step?.stepIdentifier);
    return (currentIndex + 1 > task.steps.length - 1)
        ? null
        : task.steps[currentIndex + 1];
  }

  StepClean? peekHistory() {
    if (history.isEmpty) {
      return null;
    }
    return history.last;
  }

  bool hasPreviousStep() {
    final step = peekHistory();
    return step != null;
  }

  void record(StepClean step) {
    history.add(step);
  }

  int get countSteps => task.steps.length;
  int currentStepIndex(StepClean step) {
    return task.steps.indexOf(step);
  }
}