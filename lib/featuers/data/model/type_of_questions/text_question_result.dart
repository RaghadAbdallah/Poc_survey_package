
import '../question_result.dart';
import '../result.dart';
class TextQuestionResult extends QuestionResult<String?> {
  TextQuestionResult({
    required Identifier id,
    required String valueIdentifier,
    required String? result,
  }) : super(
          id: id,
          valueIdentifier: valueIdentifier,
          result: result,
        );

  factory TextQuestionResult.fromJson(Map<String, dynamic> json) => _$TextQuestionResultFromJson(json);

  Map<String, dynamic> toJson() => _$TextQuestionResultToJson(this);

  @override
  List<Object?> get props => [id,  valueIdentifier, result];
}

TextQuestionResult _$TextQuestionResultFromJson(Map<String, dynamic> json) =>
    TextQuestionResult(
      id: Identifier.fromJson(json['id'] as Map<String, dynamic>),
      valueIdentifier: json['valueIdentifier'] as String,
      result: json['result'] as String?,
    );

Map<String, dynamic> _$TextQuestionResultToJson(TextQuestionResult instance) =>
    <String, dynamic>{
      'id': instance.id?.toJson(),
      'result': instance.result,
      'valueIdentifier': instance.valueIdentifier,
    };
