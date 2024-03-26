import 'package:json_annotation/json_annotation.dart';
import 'package:poc_itg_survey/featuers/presentation/type_of_answer/text_choice.dart';
import 'answer_format.dart';


@JsonSerializable()
class MultipleChoiceAnswerFormat implements AnswerFormat {
  final List<TextChoice> textChoices;
  @JsonKey(defaultValue: const [])
  final List<TextChoice> defaultSelection;
  @JsonKey(defaultValue: false)
  final bool otherField;
  @JsonKey(defaultValue: 100)
  final int maxAnswers;

  const MultipleChoiceAnswerFormat({
    required this.textChoices,
    this.defaultSelection = const [],
    this.otherField = false,
    this.maxAnswers = 100
  }) : super();

  factory MultipleChoiceAnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$MultipleChoiceAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$MultipleChoiceAnswerFormatToJson(this);
}

MultipleChoiceAnswerFormat _$MultipleChoiceAnswerFormatFromJson(
    Map<String, dynamic> json) =>
    MultipleChoiceAnswerFormat(
      textChoices: (json['QuestionsResultSurveyList'] as List<dynamic>)
          .map((e) => TextChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultSelection: (json['defaultSelection'] as List<dynamic>?)
          ?.map((e) => TextChoice.fromJson(e as Map<String, dynamic>))
          .toList() ??
          [],
      otherField: json['otherField'] as bool? ?? false,
    );

Map<String, dynamic> _$MultipleChoiceAnswerFormatToJson(
    MultipleChoiceAnswerFormat instance) =>
    <String, dynamic>{
      'textChoices': instance.textChoices,
      'defaultSelection': instance.defaultSelection,
      'otherField': instance.otherField,
    };
