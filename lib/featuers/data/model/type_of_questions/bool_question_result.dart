
import 'package:json_annotation/json_annotation.dart';
import '../../../presentation/type_of_answer/boolean_answer_format.dart';
import '../question_result.dart';
import '../result.dart';
@JsonSerializable(explicitToJson: true)
class BooleanQuestionResult extends QuestionResult<BooleanResult?> {
  BooleanQuestionResult({
    required Identifier id,
    required String valueIdentifier,
    required BooleanResult? result,
  }) : super(
          id: id,
          valueIdentifier: valueIdentifier,
          result: result,
        );

  factory BooleanQuestionResult.fromJson(Map<String, dynamic> json) => _$BooleanQuestionResultFromJson(json);

  Map<String, dynamic> toJson() => _$BooleanQuestionResultToJson(this);

  @override
  List<Object?> get props => [id,   valueIdentifier, result];
}
BooleanQuestionResult _$BooleanQuestionResultFromJson(
    Map<String, dynamic> json) =>
    BooleanQuestionResult(
      id: Identifier.fromJson(json['id'] as Map<String, dynamic>),
      valueIdentifier: json['valueIdentifier'] as String,
      result: $enumDecodeNullable(_$BooleanResultEnumMap, json['result']),
    );

Map<String, dynamic> _$BooleanQuestionResultToJson(
    BooleanQuestionResult instance) =>
    <String, dynamic>{
      'id': instance.id?.toJson(),
      'result': _$BooleanResultEnumMap[instance.result],
      'valueIdentifier': instance.valueIdentifier,
    };

const _$BooleanResultEnumMap = {
  BooleanResult.NONE: 'NONE',
  BooleanResult.POSITIVE: 'POSITIVE',
  BooleanResult.NEGATIVE: 'NEGATIVE',
};
