import 'package:json_annotation/json_annotation.dart';

import 'answer_format.dart';
class ScaleAnswerFormat implements AnswerFormat {
  final double maximumValue;
  final double minimumValue;
  final double defaultValue;
  final double step;
  final String maximumValueDescription;
  final String minimumValueDescription;
  final bool showValue;

  const ScaleAnswerFormat({
    required this.maximumValue,
    required this.minimumValue,
    required this.defaultValue,
    required this.step,
    this.maximumValueDescription = '',
    this.minimumValueDescription = '',
    this.showValue = true,
  }) : super();

  factory ScaleAnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$ScaleAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$ScaleAnswerFormatToJson(this);
}

ScaleAnswerFormat _$ScaleAnswerFormatFromJson(Map<String, dynamic> json) =>
    ScaleAnswerFormat(
      maximumValue: (json['maximumValue'] as num).toDouble(),
      minimumValue: (json['minimumValue'] as num).toDouble(),
      defaultValue: (json['defaultValue'] as num).toDouble(),
      step: (json['step'] as num).toDouble(),
      maximumValueDescription: json['maximumValueDescription'] as String? ?? '',
      minimumValueDescription: json['minimumValueDescription'] as String? ?? '',
      showValue: json['showValue'] as bool? ?? true,
    );

Map<String, dynamic> _$ScaleAnswerFormatToJson(ScaleAnswerFormat instance) =>
    <String, dynamic>{
      'maximumValue': instance.maximumValue,
      'minimumValue': instance.minimumValue,
      'defaultValue': instance.defaultValue,
      'step': instance.step,
      'maximumValueDescription': instance.maximumValueDescription,
      'minimumValueDescription': instance.minimumValueDescription,
      'showValue': instance.showValue,
    };
