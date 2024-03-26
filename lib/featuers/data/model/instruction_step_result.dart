

import 'package:json_annotation/json_annotation.dart';

import 'question_result.dart';
import 'result.dart';


@JsonSerializable(explicitToJson: true)
class InstructionStepResult extends QuestionResult {
  InstructionStepResult(
      Identifier id,
      ) : super(
    id: id,
    valueIdentifier: 'instruction',
    result: null,
  );
  factory InstructionStepResult.fromJson(Map<String, dynamic> json) =>
      _$InstructionStepResultFromJson(json);

  Map<String, dynamic> toJson() => _$InstructionStepResultToJson(this);

  @override
  List<Object?> get props => [id , valueIdentifier];
}

InstructionStepResult _$InstructionStepResultFromJson(
    Map<String, dynamic> json) =>
    InstructionStepResult(
      Identifier.fromJson(json['id'] as Map<String, dynamic>),

    );

Map<String, dynamic> _$InstructionStepResultToJson(
    InstructionStepResult instance) =>
    <String, dynamic>{
      'id': instance.id?.toJson(),
    };
