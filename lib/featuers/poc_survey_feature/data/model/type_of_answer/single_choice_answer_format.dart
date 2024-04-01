import 'package:json_annotation/json_annotation.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/data/model/type_of_answer/text_choice.dart';
import 'answer_format.dart';


@JsonSerializable()
class SingleChoiceAnswerFormat implements AnswerFormat {
  final List<TextChoice> textChoices;
  final TextChoice? defaultSelection;

  const SingleChoiceAnswerFormat({
    required this.textChoices,
    this.defaultSelection,
  }) : super();

  factory SingleChoiceAnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$SingleChoiceAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$SingleChoiceAnswerFormatToJson(this);
}
SingleChoiceAnswerFormat _$SingleChoiceAnswerFormatFromJson(
    Map<String, dynamic> json) =>
    SingleChoiceAnswerFormat(
      textChoices: (json['QuestionsResultSurveyList'] as List<dynamic>)
          .map((e) => TextChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultSelection: json['defaultSelection'] == null
          ? null
          : TextChoice.fromJson(
          json['defaultSelection'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SingleChoiceAnswerFormatToJson(
    SingleChoiceAnswerFormat instance) =>
    <String, dynamic>{
      'textChoices': instance.textChoices,
      'defaultSelection': instance.defaultSelection,
    };
