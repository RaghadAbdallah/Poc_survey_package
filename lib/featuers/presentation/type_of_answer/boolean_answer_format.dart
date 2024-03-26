import 'package:json_annotation/json_annotation.dart';
import 'answer_format.dart';

@JsonSerializable()
class BooleanAnswerFormat implements AnswerFormat {
  final String positiveAnswer;
  final String negativeAnswer;
  final BooleanResult result;

  const BooleanAnswerFormat({
    required this.positiveAnswer,
    required this.negativeAnswer,
    this.result = BooleanResult.NONE,
  }) : super();

  factory BooleanAnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$BooleanAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$BooleanAnswerFormatToJson(this);
}

enum BooleanResult { NONE, POSITIVE, NEGATIVE }

BooleanAnswerFormat _$BooleanAnswerFormatFromJson(Map<String, dynamic> json) =>
    BooleanAnswerFormat(
      positiveAnswer: json['positiveAnswer'] as String,
      negativeAnswer: json['negativeAnswer'] as String,
      result: $enumDecodeNullable(_$BooleanResultEnumMap, json['result']) ??
          BooleanResult.NONE,
    );

Map<String, dynamic> _$BooleanAnswerFormatToJson(
    BooleanAnswerFormat instance) =>
    <String, dynamic>{
      'positiveAnswer': instance.positiveAnswer,
      'negativeAnswer': instance.negativeAnswer,
      'result': _$BooleanResultEnumMap[instance.result],
    };

const _$BooleanResultEnumMap = {
  BooleanResult.NONE: 'NONE',
  BooleanResult.POSITIVE: 'POSITIVE',
  BooleanResult.NEGATIVE: 'NEGATIVE',
};
