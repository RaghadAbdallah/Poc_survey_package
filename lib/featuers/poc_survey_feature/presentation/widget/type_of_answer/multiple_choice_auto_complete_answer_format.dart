import 'package:json_annotation/json_annotation.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/presentation/widget/type_of_answer/text_choice.dart';

import 'answer_format.dart';


@JsonSerializable()
class MultipleChoiceAutoCompleteAnswerFormat implements AnswerFormat {
  final List<TextChoice> textChoices;
  @JsonKey(defaultValue: const [])
  final List<TextChoice> defaultSelection;
  @JsonKey(defaultValue: const [])
  final List<TextChoice> suggestions;
  @JsonKey(defaultValue: false)
  final bool otherField;

  const MultipleChoiceAutoCompleteAnswerFormat({
    required this.textChoices,
    this.defaultSelection = const [],
    this.suggestions = const [],
    this.otherField = false,
  }) : super();

  factory MultipleChoiceAutoCompleteAnswerFormat.fromJson(
          Map<String, dynamic> json) =>
      _$MultipleChoiceAutoCompleteAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() =>
      _$MultipleChoiceAutoCompleteAnswerFormatToJson(this);
}
MultipleChoiceAutoCompleteAnswerFormat
_$MultipleChoiceAutoCompleteAnswerFormatFromJson(
    Map<String, dynamic> json) =>
    MultipleChoiceAutoCompleteAnswerFormat(
      textChoices: (json['textChoices'] as List<dynamic>)
          .map((e) => TextChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultSelection: (json['defaultSelection'] as List<dynamic>?)
          ?.map((e) => TextChoice.fromJson(e as Map<String, dynamic>))
          .toList() ??
          [],
      suggestions: (json['suggestions'] as List<dynamic>?)
          ?.map((e) => TextChoice.fromJson(e as Map<String, dynamic>))
          .toList() ??
          [],
      otherField: json['otherField'] as bool? ?? false,
    );

Map<String, dynamic> _$MultipleChoiceAutoCompleteAnswerFormatToJson(
    MultipleChoiceAutoCompleteAnswerFormat instance) =>
    <String, dynamic>{
      'textChoices': instance.textChoices,
      'defaultSelection': instance.defaultSelection,
      'suggestions': instance.suggestions,
      'otherField': instance.otherField,
    };
