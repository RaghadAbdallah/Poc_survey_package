

import 'package:poc_itg_survey/featuers/poc_survey_feature/presentation/widget/type_of_answer/scale_answer_format.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/presentation/widget/type_of_answer/single_choice_answer_format.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/presentation/widget/type_of_answer/text_answer_format.dart';


 import 'integer_answer_format.dart';
import 'multiple_choice_answer_format.dart';

abstract class AnswerFormat {
  const AnswerFormat();

  factory AnswerFormat.fromJson(Map<String, dynamic> json) {
    switch (json['type'] as String) {
      case 'integer':
      case 'double':
        return IntegerAnswerFormat.fromJson(json);
      case 'text':
        return TextAnswerFormat.fromJson(json);
      case 'single':
        return SingleChoiceAnswerFormat.fromJson(json);
      case 'multiple':
        return MultipleChoiceAnswerFormat.fromJson(json);
      case 'scale':
        return ScaleAnswerFormat.fromJson(json);
      default:
        throw AnswerFormatNotDefinedException();
    }
  }
  Map<String, dynamic> toJson();
}
class AnswerFormatNotDefinedException implements Exception {
  const AnswerFormatNotDefinedException() : super();
}
