
import 'package:json_annotation/json_annotation.dart';

import '../../../presentation/type_of_answer/text_choice.dart';
import '../question_result.dart';
import '../result.dart';


@JsonSerializable(explicitToJson: true)
class MultipleChoiceQuestionResult extends QuestionResult<List<TextChoice>?> {
  MultipleChoiceQuestionResult({
    required Identifier id,
    required String valueIdentifier,
    required List<TextChoice>? result,
  }) : super(
          id: id,
          valueIdentifier: valueIdentifier,
          result: result,
        );

  factory MultipleChoiceQuestionResult.fromJson(Map<String, dynamic> json) =>
      _$MultipleChoiceQuestionResultFromJson(json);

  Map<String, dynamic> toJson() => _$MultipleChoiceQuestionResultToJson(this);

  @override
  List<Object?> get props => [id,  valueIdentifier, result];
}

MultipleChoiceQuestionResult _$MultipleChoiceQuestionResultFromJson(
    Map<String, dynamic> json) =>
    MultipleChoiceQuestionResult(
      id: Identifier.fromJson(json['id'] as Map<String, dynamic>),
      valueIdentifier: json['valueIdentifier'] as String,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => TextChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MultipleChoiceQuestionResultToJson(
    MultipleChoiceQuestionResult instance) =>
    <String, dynamic>{
      'id': instance.id?.toJson(),
      'result': instance.result?.map((e) => e.toJson()).toList(),
      'valueIdentifier': instance.valueIdentifier,
    };
