import 'package:json_annotation/json_annotation.dart';
import 'package:poc_itg_survey/core/task/task_identifier.dart';
import '../../featuers/poc_survey_feature/presentation/page/step.dart';
import 'navigable_task.dart';
import 'order_task.dart';

abstract class Task {
  late final TaskIdentifier id;
  @JsonKey(defaultValue: [])
  final List<Step> steps;
  final Step? initialStep;

  Task({
    TaskIdentifier? id,
    this.steps = const [],
    this.initialStep,
  }) {
    this.id = id ?? TaskIdentifier();
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    final type = json['type'];
    if (type == 'ordered') {
      return OrderedTask.fromJson(json);
    } else if (type == 'navigable') {
      return NavigableTask.fromJson(json);
    }
    throw TaskNotDefinedException();
  }

  Map<String, dynamic> toJson();

  bool operator ==(o) => o is Task && o.id == id;
  int get hashCode => id.hashCode ^ steps.hashCode;
}
class TaskNotDefinedException implements Exception {
  const TaskNotDefinedException() : super();
}
