
import 'package:json_annotation/json_annotation.dart';

import 'question_result.dart';
import 'result.dart';

@JsonSerializable(explicitToJson: true)
class CompletionStepResult extends QuestionResult {
  CompletionStepResult(
    Identifier id,
  ) : super(
          id: id,
          valueIdentifier: 'completion',
          result: null,
        );
  factory CompletionStepResult.fromJson(Map<String, dynamic> json) =>
      _$CompletionStepResultFromJson(json);

  Map<String, dynamic> toJson() => _$CompletionStepResultToJson(this);

  @override
  List<Object?> get props => [id, valueIdentifier];
}
CompletionStepResult _$CompletionStepResultFromJson(
    Map<String, dynamic> json) =>
    CompletionStepResult(
      Identifier.fromJson(json['id'] as Map<String, dynamic>),

    );

Map<String, dynamic> _$CompletionStepResultToJson(
    CompletionStepResult instance) =>
    <String, dynamic>{
      'id': instance.id?.toJson(),
    };
