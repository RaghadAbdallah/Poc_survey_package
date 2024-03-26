import 'package:json_annotation/json_annotation.dart';

import '../question_result.dart';
import '../result.dart';


@JsonSerializable(explicitToJson: true)
class IntegerQuestionResult extends QuestionResult<int?> {
  IntegerQuestionResult({
    required Identifier id,
    required String valueIdentifier,
    required int? result,
  }) : super(
          id: id,
          valueIdentifier: valueIdentifier,
          result: result,
        );

  factory IntegerQuestionResult.fromJson(Map<String, dynamic> json) => _$IntegerQuestionResultFromJson(json);

  Map<String, dynamic> toJson() => _$IntegerQuestionResultToJson(this);

  @override
  List<Object?> get props => [id,   valueIdentifier, result];
}

IntegerQuestionResult _$IntegerQuestionResultFromJson(
    Map<String, dynamic> json) =>
    IntegerQuestionResult(
      id: Identifier.fromJson(json['id'] as Map<String, dynamic>),
      valueIdentifier: json['valueIdentifier'] as String,
      result: json['result'] as int?,
    );

Map<String, dynamic> _$IntegerQuestionResultToJson(
    IntegerQuestionResult instance) =>
    <String, dynamic>{
      'id': instance.id?.toJson(),
      'result': instance.result,
      'valueIdentifier': instance.valueIdentifier,
    };
