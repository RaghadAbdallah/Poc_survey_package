
 import 'package:json_annotation/json_annotation.dart';
import 'package:poc_itg_survey/core/task/task.dart';
import 'package:poc_itg_survey/core/task/task_identifier.dart';
 import '../../featuers/poc_survey_feature/presentation/page/step.dart';
 /// Defines a [Task] which handles its steps in the order of the [steps] list.
@JsonSerializable(createFactory: false)
class OrderedTask extends Task {
  OrderedTask({
    required TaskIdentifier id,
    required List<Step> steps,
    Step? initialStep,
  }) : super(
    id: id,
    steps: steps,
    initialStep: initialStep,
  );

  factory OrderedTask.fromJson(Map<String, dynamic> json) => OrderedTask(
    id: TaskIdentifier.fromJson(json),
    steps: json['steps'] != null
        ? (json['steps'] as List<Map<String, dynamic>>)
        .map((step) => Step.fromJson(step))
        .toList()
        : [],
  );

  Map<String, dynamic> toJson() => _$OrderedTaskToJson(this);
}
Map<String, dynamic> _$OrderedTaskToJson(OrderedTask instance) =>
    <String, dynamic>{
      'id': instance.id,
      'steps': instance.steps,
      'initalStep': instance.initialStep,
      'hashCode': instance.hashCode,
    };
