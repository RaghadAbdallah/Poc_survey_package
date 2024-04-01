
import '../../../../core/models/result.dart';
import 'input_answer_model.dart';
class StepResultClean extends Result {
  @_Converter()
  final List<InputQuestionResult> results;

  StepResultClean({
    required Identifier? id,
    required this.results,
  }) : super(id: id );

  factory StepResultClean.fromQuestion({required InputQuestionResult questionResult}) {
    return StepResultClean(
      id: questionResult.id,
      results: [questionResult],
    );
  }

  factory StepResultClean.fromJson(Map<String, dynamic> json) =>
      _$StepResultFromJson(json);

  Map<String, dynamic> toJson() => _$StepResultToJson(this);

  @override
  List<Object?> get props => [id];
}

class _Converter {
  const _Converter();

  Object toJson(List<InputQuestionResult> questionResults) {
    List<Map<String, dynamic>> allQuestionResultsEncoded = [];

    for (InputQuestionResult qr in questionResults) {
      final qrJson = qr.toJson();
      qrJson['type'] = qr.runtimeType.toString(); // Use runtimeType directly
      allQuestionResultsEncoded.add(qrJson);
    }

    return allQuestionResultsEncoded;
  }

  List<InputQuestionResult> fromJson(Object json) {
    final List<InputQuestionResult> results = [];
    for (var element in json as List<dynamic>) {
      final qData = element as Map<String, dynamic>;
      final qType = qData['type'] as String;
      final result = _createQuestionResult(qType, qData);
      results.add(result);
    }
    return results;
  }

  InputQuestionResult _createQuestionResult(String type, Map<String, dynamic> data) {
    switch (type) {
       case 'IntegerQuestionResult':
         return InputQuestionResult.fromJson(data);
      default:
        throw ('Unhandled Question Result Type: $type');
    }
  }
}

StepResultClean _$StepResultFromJson(Map<String, dynamic> json) => StepResultClean(
  id: json['id'] == null
      ? null
      : Identifier.fromJson(json['id'] as Map<String, dynamic>),
  results: const _Converter().fromJson(json['results'] as Object),
);

Map<String, dynamic> _$StepResultToJson(StepResultClean instance) => <String, dynamic>{
  'id': instance.id?.toJson(),
  'results': const _Converter().toJson(instance.results),
};