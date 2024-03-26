import 'package:poc_itg_survey/featuers/data/model/result.dart';

abstract class QuestionResult<T> extends Result {
  final T? result;
  final String? valueIdentifier;

  QuestionResult({
    required Identifier? id,
    required this.valueIdentifier,
    required this.result,
  }) : super(id: id)   ;

  Map<String, dynamic> toJson() {
    return {
      'id': id?.toJson(),
      'valueIdentifier': valueIdentifier,
      'result': result,
    };
  }
}
