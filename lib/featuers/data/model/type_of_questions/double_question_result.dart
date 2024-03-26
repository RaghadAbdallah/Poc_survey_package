
import 'package:json_annotation/json_annotation.dart';

import '../question_result.dart';
import '../result.dart';


@JsonSerializable(explicitToJson: true)
class DoubleQuestionResult extends QuestionResult<double?> {
  DoubleQuestionResult({
    required Identifier id,
    required String valueIdentifier,
    required double? result,
  }) : super(
          id: id,
          valueIdentifier: valueIdentifier,
          result: result,
        );

  factory DoubleQuestionResult.fromJson(Map<String, dynamic> json) => _$DoubleQuestionResultFromJson(json);

  Map<String, dynamic> toJson() => _$DoubleQuestionResultToJson(this);

  @override
  List<Object?> get props => [id,  valueIdentifier, result];
}
DoubleQuestionResult _$DoubleQuestionResultFromJson(
    Map<String, dynamic> json) =>
    DoubleQuestionResult(
      id: Identifier.fromJson(json['id'] as Map<String, dynamic>),
      valueIdentifier: json['valueIdentifier'] as String,
      result: (json['result'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DoubleQuestionResultToJson(
    DoubleQuestionResult instance) =>
    <String, dynamic>{
      'id': instance.id?.toJson(),
      'result': instance.result,
      'valueIdentifier': instance.valueIdentifier,
    };
