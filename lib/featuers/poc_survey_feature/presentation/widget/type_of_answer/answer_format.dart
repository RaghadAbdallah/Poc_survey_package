

import 'package:poc_itg_survey/featuers/poc_survey_feature/presentation/widget/type_of_answer/scale_answer_format.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/presentation/widget/type_of_answer/single_choice_answer_format.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/presentation/widget/type_of_answer/text_answer_format.dart';

import 'boolean_answer_format.dart';
 import 'double_answer_format.dart';
 import 'integer_answer_format.dart';
import 'multiple_choice_answer_format.dart';
import 'multiple_choice_auto_complete_answer_format.dart';
import 'multiple_double_answer_format.dart';

abstract class AnswerFormat {
  const AnswerFormat();

  factory AnswerFormat.fromJson(Map<String, dynamic> json) {
    switch (json['type'] as String) {
      case 'bool':
        return BooleanAnswerFormat.fromJson(json);
      case 'integer':
        return IntegerAnswerFormat.fromJson(json);
      case 'double':
        return DoubleAnswerFormat.fromJson(json);
      case 'text':
        return TextAnswerFormat.fromJson(json);

      case 'single':
        return SingleChoiceAnswerFormat.fromJson(json);
      case 'multiple':
        return MultipleChoiceAnswerFormat.fromJson(json);
      case 'multiple_double':
        return MultipleDoubleAnswerFormat.fromJson(json);
      case 'multiple_auto_complete':
        return MultipleChoiceAutoCompleteAnswerFormat.fromJson(json);
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
