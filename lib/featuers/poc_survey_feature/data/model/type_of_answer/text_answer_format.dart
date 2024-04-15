import 'package:json_annotation/json_annotation.dart';

import 'answer_format.dart';
class TextAnswerFormat implements AnswerFormat {
  final int? maxLines;
  @JsonKey(defaultValue: '')
  final String hint;

  /// Regular expression by which the text gets validated
  /// default: '^(?!\s*$).+' that checks if the entered text is empty
  /// to allow any type of an answer including an empty one;
  /// set it explicitly to null.
  ///
  @JsonKey(defaultValue: '^(?!\s*\$).+')
  final String? validationRegEx;

  const TextAnswerFormat({
    this.maxLines,
    this.hint = '',
    this.validationRegEx = '^(?!\s*\$).+',
  }) : super();

  factory TextAnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$TextAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$TextAnswerFormatToJson(this);
}

TextAnswerFormat _$TextAnswerFormatFromJson(Map<String, dynamic> json) =>
    TextAnswerFormat(
      maxLines: json['maxLines'] as int?,
      hint: json['hint'] as String? ?? '',
      validationRegEx: json['validationRegEx'] as String? ?? r'^(?!s*$).+',
    );

Map<String, dynamic> _$TextAnswerFormatToJson(TextAnswerFormat instance) =>
    <String, dynamic>{
      'maxLines': instance.maxLines,
      'hint': instance.hint,
      'validationRegEx': instance.validationRegEx,
    };
