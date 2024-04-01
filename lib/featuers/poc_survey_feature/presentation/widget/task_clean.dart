import 'package:json_annotation/json_annotation.dart';
import 'package:poc_itg_survey/core/models/order_task_clean.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/presentation/widget/steps_clean/steps_clean.dart';
import '../../../../core/models/task_identifier.dart';
import '../../data/model/navigable_task_clean.dart';

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
      return OrderedTaskClean.fromJson(json);
    } else if (type == 'navigable') {
      return NavigableTaskClean.fromJson(json);
    }
    throw const TaskNotDefinedException();
  }

  Map<String, dynamic> toJson();

  bool operator ==(o) => o is TaskClean && o.id == id;
  int get hashCode => id.hashCode ^ steps.hashCode;
}
class TaskNotDefinedException implements Exception {
  const TaskNotDefinedException() : super();
}