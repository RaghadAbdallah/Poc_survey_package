import 'package:equatable/equatable.dart';
import '../../../featuers/data/model/result.dart';

class InputQuestionResult<T> extends Equatable {
  final T? result;
  final String? valueIdentifier;
  final Identifier? id;

  const InputQuestionResult(
      {required this.id, required this.result, required this.valueIdentifier});

  Map<String, dynamic> toJson() => _$InputQuestionResultToJson(this);

  @override
  List<Object?> get props => [id, result, valueIdentifier];

  factory InputQuestionResult.fromJson(Map<String, dynamic> json) {
    return InputQuestionResult(
      id: Identifier.fromJson(json['id'] as Map<String, dynamic>),
      valueIdentifier: json['valueIdentifier'] as String,
      result: json['result'],
    );
  }

  Map<String, dynamic> _$InputQuestionResultToJson(
          InputQuestionResult instance) =>
      <String, dynamic>{
        'id': instance.id?.toJson(),
        'result': instance.result,
        'valueIdentifier': instance.valueIdentifier,
      };
}
