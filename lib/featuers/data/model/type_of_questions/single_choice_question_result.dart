
import 'package:json_annotation/json_annotation.dart';

import '../../../presentation/type_of_answer/text_choice.dart';
import '../question_result.dart';
import '../result.dart';

@JsonSerializable(explicitToJson: true)
class SingleChoiceQuestionResult extends QuestionResult<TextChoice?> {
  SingleChoiceQuestionResult({
    required Identifier id,
    required String valueIdentifier,
    required TextChoice? result,
  }) : super(
          id: id,
          valueIdentifier: valueIdentifier,
          result: result,
        );

  factory SingleChoiceQuestionResult.fromJson(Map<String, dynamic> json) => _$SingleChoiceQuestionResultFromJson(json);

  Map<String, dynamic> toJson() => _$SingleChoiceQuestionResultToJson(this);

  @override
  List<Object?> get props => [id, valueIdentifier, result];
}

SingleChoiceQuestionResult _$SingleChoiceQuestionResultFromJson(
    Map<String, dynamic> json) =>
    SingleChoiceQuestionResult(
      id: Identifier.fromJson(json['id'] as Map<String, dynamic>),
      valueIdentifier: json['valueIdentifier'] as String,
      result: json['result'] == null
          ? null
          : TextChoice.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SingleChoiceQuestionResultToJson(
    SingleChoiceQuestionResult instance) =>
    <String, dynamic>{
      'id': instance.id?.toJson(),
      'result': instance.result?.toJson(),
      'valueIdentifier': instance.valueIdentifier,
    };
