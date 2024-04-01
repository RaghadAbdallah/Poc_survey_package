import 'package:json_annotation/json_annotation.dart';

import '../../../../core/models/result.dart';
import 'input_answer_model.dart';

@JsonSerializable(explicitToJson: true)
class InstructionStepResultClean extends InputQuestionResult {
  InstructionStepResultClean(
      Identifier id,
      ) : super(
    id: id,
    valueIdentifier: 'instruction',
    result: null,
  );
  factory InstructionStepResultClean.fromJson(Map<String, dynamic> json) =>
      _$InstructionStepResultFromJson(json);

  Map<String, dynamic> toJson() => _$InstructionStepResultToJson(this);

  @override
  List<Object?> get props => [id , valueIdentifier];
}

InstructionStepResultClean _$InstructionStepResultFromJson(
    Map<String, dynamic> json) =>
    InstructionStepResultClean(
      Identifier.fromJson(json['id'] as Map<String, dynamic>),

    );

Map<String, dynamic> _$InstructionStepResultToJson(
    InstructionStepResultClean instance) =>
    <String, dynamic>{
      'id': instance.id?.toJson(),
    };
