import 'package:json_annotation/json_annotation.dart';

import '../../data/model/result.dart';


@JsonSerializable()
class StepIdentifier extends Identifier {
  StepIdentifier({String? id}) : super(id: id);

  factory StepIdentifier.fromJson(Map<String, dynamic> json) =>
      _$StepIdentifierFromJson(json);
  Map<String, dynamic> toJson() => _$StepIdentifierToJson(this);

  bool operator ==(o) => o is StepIdentifier && id == o.id;
  int get hashCode => id.hashCode;
}StepIdentifier _$StepIdentifierFromJson(Map<String, dynamic> json) =>
    StepIdentifier(
      id: json['id'] as String?,
    );

Map<String, dynamic> _$StepIdentifierToJson(StepIdentifier instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

