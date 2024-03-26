import 'package:poc_itg_survey/featuers/data/model/result.dart';

import '../../../core/models/json_convert.dart';
import '../../data/model/question_result.dart';
import '../../data/model/type_of_questions/bool_question_result.dart';
import '../../data/model/type_of_questions/double_question_result.dart';
import '../../data/model/type_of_questions/integer_question_result.dart';
import '../../data/model/type_of_questions/multiple_choice_question_result.dart';
import '../../data/model/type_of_questions/multiple_double_question_result.dart';
import '../../data/model/type_of_questions/scale_question_result.dart';
import '../../data/model/type_of_questions/single_choice_question_result.dart';
import '../../data/model/type_of_questions/text_question_result.dart';
import '../../data/model/completion_step_result.dart';
import '../../data/model/instruction_step_result.dart';

class StepResult extends Result {
  @_Converter()
  final List<QuestionResult> results;

  StepResult({
    required Identifier? id,
    required this.results,
  }) : super(id: id );

  factory StepResult.fromQuestion({required QuestionResult questionResult}) {
    return StepResult(
      id: questionResult.id,
      results: [questionResult],
    );
  }

  factory StepResult.fromJson(Map<String, dynamic> json) =>
      _$StepResultFromJson(json);

  Map<String, dynamic> toJson() => _$StepResultToJson(this);

  @override
  List<Object?> get props => [id];
}

class _Converter implements JsonConverter<List<QuestionResult>, Object> {
  const _Converter();

  @override
  Object toJson(List<QuestionResult> questionResults) {
    List<Map<String, dynamic>> allQuestionResultsEncoded = [];

    for (QuestionResult qr in questionResults) {
      final qrJson = qr.toJson();
      qrJson['type'] = qr.runtimeType.toString(); // Use runtimeType directly
      allQuestionResultsEncoded.add(qrJson);
    }

    return allQuestionResultsEncoded;
  }

  @override
  List<QuestionResult> fromJson(Object json) {
    final List<QuestionResult> results = [];
    for (var element in json as List<dynamic>) {
      final qData = element as Map<String, dynamic>;
      final qType = qData['type'] as String;
      final result = _createQuestionResult(qType, qData);
      results.add(result);
    }
    return results;
  }

  QuestionResult _createQuestionResult(String type, Map<String, dynamic> data) {
    switch (type) {
      case 'BooleanQuestionResult':
        return BooleanQuestionResult.fromJson(data);
      case 'DoubleQuestionResult':
        return DoubleQuestionResult.fromJson(data);
      case 'IntegerQuestionResult':
        return IntegerQuestionResult.fromJson(data);
      case 'MultipleChoiceQuestionResult':
        return MultipleChoiceQuestionResult.fromJson(data);
      case 'MultipleDoubleQuestionResult':
        return MultipleDoubleQuestionResult.fromJson(data);
      case 'ScaleQuestionResult':
        return ScaleQuestionResult.fromJson(data);
      case 'SingleChoiceQuestionResult':
        return SingleChoiceQuestionResult.fromJson(data);
      case 'TextQuestionResult':
        return TextQuestionResult.fromJson(data);
      case 'InstructionStepResult':
        return InstructionStepResult.fromJson(data);
      case 'CompletionStepResult':
        return CompletionStepResult.fromJson(data);
      default:
        throw ('Unhandled Question Result Type: $type');
    }
  }
}

StepResult _$StepResultFromJson(Map<String, dynamic> json) => StepResult(
  id: json['id'] == null
      ? null
      : Identifier.fromJson(json['id'] as Map<String, dynamic>),
  results: const _Converter().fromJson(json['results'] as Object),
);

Map<String, dynamic> _$StepResultToJson(StepResult instance) => <String, dynamic>{
  'id': instance.id?.toJson(),
  'results': const _Converter().toJson(instance.results),
};
