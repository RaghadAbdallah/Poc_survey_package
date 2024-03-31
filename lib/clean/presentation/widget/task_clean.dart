import 'package:json_annotation/json_annotation.dart';
import 'package:poc_itg_survey/clean/presentation/widget/navigable_task_clean.dart';
import 'package:poc_itg_survey/clean/presentation/widget/steps_clean/steps_clean.dart';

import '../../../core/task/navigable_task.dart';
import '../../../core/task/order_task.dart';
import '../../../core/task/task_identifier.dart';

abstract class TaskClean {
  late final TaskIdentifier id;
  @JsonKey(defaultValue: [])
  final List<StepClean> steps;
  final StepClean? initialStep;

  TaskClean({
    TaskIdentifier? id,
    this.steps = const [],
    this.initialStep,
  }) {
    this.id = id ?? TaskIdentifier();
  }

  factory TaskClean.fromJson(Map<String, dynamic> json) {
    final type = json['type'];
    if (type == 'ordered') {
      return OrderedTask.fromJson(json) as TaskClean;
    } else if (type == 'navigable') {
      return NavigableTaskClean.fromJson(json) as TaskClean;
    }
    throw TaskNotDefinedException();
  }

  Map<String, dynamic> toJson();

  bool operator ==(o) => o is TaskClean && o.id == id;
  int get hashCode => id.hashCode ^ steps.hashCode;
}
class TaskNotDefinedException implements Exception {
  const TaskNotDefinedException() : super();
}