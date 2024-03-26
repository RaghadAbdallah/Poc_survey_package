
import 'package:json_annotation/json_annotation.dart';

import '../question_result.dart';
import '../result.dart';


@JsonSerializable(explicitToJson: true)
class ScaleQuestionResult extends QuestionResult<double?> {
  ScaleQuestionResult({
    required Identifier id,
    required String valueIdentifier,
    required double? result,
  }) : super(
          id: id,
          valueIdentifier: valueIdentifier,
          result: result,
        );

  factory ScaleQuestionResult.fromJson(Map<String, dynamic> json) => _$ScaleQuestionResultFromJson(json);

  Map<String, dynamic> toJson() => _$ScaleQuestionResultToJson(this);

  @override
  List<Object?> get props => [id, valueIdentifier, result];
}

ScaleQuestionResult _$ScaleQuestionResultFromJson(Map<String, dynamic> json) =>
    ScaleQuestionResult(
      id: Identifier.fromJson(json['id'] as Map<String, dynamic>),

      valueIdentifier: json['valueIdentifier'] as String,
      result: (json['result'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ScaleQuestionResultToJson(
    ScaleQuestionResult instance) =>
    <String, dynamic>{
      'id': instance.id?.toJson(),
      'result': instance.result,
      'valueIdentifier': instance.valueIdentifier,
    };
