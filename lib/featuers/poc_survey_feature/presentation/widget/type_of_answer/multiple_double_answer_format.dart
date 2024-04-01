import 'package:json_annotation/json_annotation.dart';

import 'answer_format.dart';
import 'multi_double.dart';


@JsonSerializable()
class MultipleDoubleAnswerFormat implements AnswerFormat {
  final List<MultiDouble>? defaultValues;
  @JsonKey(defaultValue: const [])
  final List<String> hints;

  const MultipleDoubleAnswerFormat({
    this.defaultValues,
    required this.hints,
  }) : super();

  factory MultipleDoubleAnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$MultipleDoubleAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$MultipleDoubleAnswerFormatToJson(this);
}
MultipleDoubleAnswerFormat _$MultipleDoubleAnswerFormatFromJson(
    Map<String, dynamic> json) =>
    MultipleDoubleAnswerFormat(
      defaultValues: (json['defaultValues'] as List<dynamic>?)
          ?.map((e) => MultiDouble.fromJson(e as Map<String, dynamic>))
          .toList(),
      hints:
      (json['hints'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          [],
    );

Map<String, dynamic> _$MultipleDoubleAnswerFormatToJson(
    MultipleDoubleAnswerFormat instance) =>
    <String, dynamic>{
      'defaultValues': instance.defaultValues,
      'hints': instance.hints,
    };
