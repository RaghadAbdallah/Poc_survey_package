import 'package:json_annotation/json_annotation.dart';
import '../../featuers/poc_survey_feature/presentation/widget/steps_clean/steps_clean.dart';
import '../../featuers/poc_survey_feature/presentation/widget/task_clean.dart';
import 'task_identifier.dart';

@JsonSerializable(createFactory: false)
class OrderedTaskClean extends TaskClean{
  OrderedTaskClean({
    required TaskIdentifier id,
    required List<StepClean> steps,
    StepClean? initialStep,
  }) : super(
    id: id,
    steps: steps,
    initialStep: initialStep,
  );

  factory OrderedTaskClean.fromJson(Map<String, dynamic> json) => OrderedTaskClean(
    id: TaskIdentifier.fromJson(json),
    steps: json['steps'] != null
        ? (json['steps'] as List<Map<String, dynamic>>)
        .map((step) => StepClean.fromJson(step))
        .toList()
        : [],
  );

  Map<String, dynamic> toJson() => _$OrderedTaskToJson(this);
}
Map<String, dynamic> _$OrderedTaskToJson(OrderedTaskClean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'steps': instance.steps,
      'initalStep': instance.initialStep,
      'hashCode': instance.hashCode,
    };