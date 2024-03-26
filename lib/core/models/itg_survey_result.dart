
import 'package:poc_itg_survey/featuers/data/model/result.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../featuers/presentation/step/steps_result.dart';

@JsonSerializable(explicitToJson: true)
class SurveyResult extends Result {
  final FinishReason finishReason;
  final List<StepResult> results;

  SurveyResult({
    required Identifier? id,
    required DateTime startDate,
    required DateTime endDate,
    required this.finishReason,
    required this.results,
  }) : super(id: id, );

  factory SurveyResult.fromJson(Map<String, dynamic> json) => _$SurveyResultFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyResultToJson(this);

  @override
  List<Object?> get props => [id,  finishReason];
}

enum FinishReason { SAVED, DISCARDED, COMPLETED, FAILED }
SurveyResult _$SurveyResultFromJson(Map<String, dynamic> json) => SurveyResult(
  id: json['id'] == null
      ? null
      : Identifier.fromJson(json['id'] as Map<String, dynamic>),
  startDate: DateTime.parse(json['startDate'] as String),
  endDate: DateTime.parse(json['endDate'] as String),
  finishReason: $enumDecode(_$FinishReasonEnumMap, json['finishReason']),
  results: (json['results'] as List<dynamic>)
      .map((e) => StepResult.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SurveyResultToJson(SurveyResult instance) =>
    <String, dynamic>{
      'id': instance.id?.toJson(),
      'finishReason': _$FinishReasonEnumMap[instance.finishReason],
      'results': instance.results.map((e) => e.toJson()).toList(),
    };

const _$FinishReasonEnumMap = {
  FinishReason.SAVED: 'SAVED',
  FinishReason.DISCARDED: 'DISCARDED',
  FinishReason.COMPLETED: 'COMPLETED',
  FinishReason.FAILED: 'FAILED',
};
