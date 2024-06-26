import 'package:json_annotation/json_annotation.dart';
import 'package:poc_itg_survey/core/task/task.dart';

import '../../featuers/data/model/result.dart';

/// Used to uniquly identify a [Task]
@JsonSerializable()
class TaskIdentifier extends Identifier {
  TaskIdentifier({String? id}) : super(id: id);

  factory TaskIdentifier.fromJson(Map<String, dynamic> json) =>
      _$TaskIdentifierFromJson(json);
  Map<String, dynamic> toJson() => _$TaskIdentifierToJson(this);
}

TaskIdentifier _$TaskIdentifierFromJson(Map<String, dynamic> json) =>
    TaskIdentifier(
      id: json['id'] as String?,
    );

Map<String, dynamic> _$TaskIdentifierToJson(TaskIdentifier instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
