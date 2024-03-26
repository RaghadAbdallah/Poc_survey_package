
import 'package:json_annotation/json_annotation.dart';

import '../../../presentation/type_of_answer/multi_double.dart';
import '../question_result.dart';
import '../result.dart';


@JsonSerializable(explicitToJson: true)
class MultipleDoubleQuestionResult extends QuestionResult<List<MultiDouble>?> {
  MultipleDoubleQuestionResult({
    required Identifier id,
    required String valueIdentifier,
    required List<MultiDouble>? result,
  }) : super(
          id: id,
          valueIdentifier: valueIdentifier,
          result: result,
        );

  factory MultipleDoubleQuestionResult.fromJson(Map<String, dynamic> json) => _$MultipleDoubleQuestionResultFromJson(json);

  Map<String, dynamic> toJson() => _$MultipleDoubleQuestionResultToJson(this);

  @override
  List<Object?> get props => [id,   valueIdentifier, result];
}
MultipleDoubleQuestionResult _$MultipleDoubleQuestionResultFromJson(
    Map<String, dynamic> json) =>
    MultipleDoubleQuestionResult(
      id: Identifier.fromJson(json['id'] as Map<String, dynamic>),
      valueIdentifier: json['valueIdentifier'] as String,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => MultiDouble.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MultipleDoubleQuestionResultToJson(
    MultipleDoubleQuestionResult instance) =>
    <String, dynamic>{
      'id': instance.id?.toJson(),
      'result': instance.result?.map((e) => e.toJson()).toList(),
      'valueIdentifier': instance.valueIdentifier,
    };
