import 'package:json_annotation/json_annotation.dart';
import 'answer_format.dart';

@JsonSerializable()
class IntegerAnswerFormat implements AnswerFormat {
  final int? defaultValue;
  final String hint;

  const IntegerAnswerFormat({
    this.defaultValue,
    this.hint = '',
  }) : super();

  factory IntegerAnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$IntegerAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$IntegerAnswerFormatToJson(this);
}
IntegerAnswerFormat _$IntegerAnswerFormatFromJson(Map<String, dynamic> json) =>
    IntegerAnswerFormat(
      defaultValue: json['defaultValue'] as int?,
      hint: json['hint'] as String? ?? '',
    );

Map<String, dynamic> _$IntegerAnswerFormatToJson(
    IntegerAnswerFormat instance) =>
    <String, dynamic>{
      'defaultValue': instance.defaultValue,
      'hint': instance.hint,
    };
