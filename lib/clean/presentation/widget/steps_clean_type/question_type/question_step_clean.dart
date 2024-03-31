import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poc_itg_survey/clean/model/input_format_model/input_answer_model.dart';
import 'package:poc_itg_survey/clean/presentation/widget/steps_clean/steps_clean.dart';
import 'package:poc_itg_survey/clean/presentation/widget/steps_clean_type/question_type/type_of_question/choice_question_answer/boolean_choice_format_answer.dart';
import 'package:poc_itg_survey/clean/presentation/widget/steps_clean_type/question_type/type_of_question/choice_question_answer/muliple_choice_format_answer.dart';
import 'package:poc_itg_survey/clean/presentation/widget/steps_clean_type/question_type/type_of_question/choice_question_answer/multiple_choice_auto_complete_answer_view.dart';
import 'package:poc_itg_survey/clean/presentation/widget/steps_clean_type/question_type/type_of_question/choice_question_answer/single_choice_format_answer.dart';
import 'package:poc_itg_survey/clean/presentation/widget/steps_clean_type/question_type/type_of_question/input_question_answer/integer_formate_answer.dart';
import 'package:poc_itg_survey/clean/presentation/widget/steps_clean_type/question_type/type_of_question/input_question_answer/text_format_answer.dart';
import 'package:poc_itg_survey/clean/presentation/widget/steps_clean_type/question_type/type_of_question/rating_question_answer/scale_format_answer.dart';
import 'package:poc_itg_survey/featuers/presentation/step/step_identifer.dart';

import '../../../../../featuers/presentation/type_of_answer/answer_format.dart';
import '../../../../../featuers/presentation/type_of_answer/boolean_answer_format.dart';
import '../../../../../featuers/presentation/type_of_answer/double_answer_format.dart';
import '../../../../../featuers/presentation/type_of_answer/integer_answer_format.dart';
import '../../../../../featuers/presentation/type_of_answer/multiple_choice_answer_format.dart';
import '../../../../../featuers/presentation/type_of_answer/multiple_choice_auto_complete_answer_format.dart';
 import '../../../../../featuers/presentation/type_of_answer/scale_answer_format.dart';
import '../../../../../featuers/presentation/type_of_answer/single_choice_answer_format.dart';
import '../../../../../featuers/presentation/type_of_answer/text_answer_format.dart';

@JsonSerializable()
class QuestionStepClean extends StepClean {
  final String title;
  final String text;
  final Widget content;
  final AnswerFormat answerFormat;

  QuestionStepClean({
    bool isOptional = false,
    String buttonText = 'Next',
    StepIdentifier? stepIdentifier,
    bool showAppBar = true,
    this.title = '',
    this.text = '',
    this.content = const SizedBox.shrink(),
    required this.answerFormat,
  }) : super(
    stepIdentifier: stepIdentifier,
    isOptional: isOptional,
    buttonText: buttonText,
    showAppBar: showAppBar,
  );

  @override
  Widget createView({required InputQuestionResult? questionResult}) {
    final key = ObjectKey(stepIdentifier.id);

    switch (answerFormat.runtimeType) {
      case IntegerAnswerFormat:
        return IntegerFormatViewClean(
          questionStep: this,
          result: questionResult,
        );
      // case DoubleAnswerFormat:
      //   return DoubleAnswerView(
      //     key: key,
      //     questionStep: this,
      //     result: questionResult as DoubleQuestionResult?,
      //   );
      case TextAnswerFormat:
        return TextFormatViewClean(
          questionStep: this,
          result: questionResult,
        );
      case SingleChoiceAnswerFormat:
        FocusManager.instance.primaryFocus?.unfocus();
        return SingleChoiceAnswerViewClean(
          questionStep: this,
          result: questionResult,
        );
      case MultipleChoiceAnswerFormat:
        return MultipleChoiceAnswerViewClean(
          questionStep: this,
          result: questionResult,
        );
      case ScaleAnswerFormat:
        return ScaleAnswerViewClean(
          questionStep: this,
          result: questionResult,
        );
      case BooleanAnswerFormat:
        return BooleanViewClean(
          questionStep: this,
          result: questionResult ,
        );

      // case MultipleDoubleAnswerFormat:
      //   return MultipleDoubleAnswerView(
      //     key: key,
      //     questionStep: this,
      //     result: questionResult as MultipleDoubleQuestionResult?,
      //   );
      case MultipleChoiceAutoCompleteAnswerFormat:
        return MultipleChoiceAutoCompleteAnswerViewClean(
          questionStep: this,
          result: questionResult,
        );
      default:
        throw AnswerFormatNotDefinedException();
    }
  }

  factory QuestionStepClean.fromJson(Map<String, dynamic> json) =>
      _$QuestionStepFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionStepToJson(this);
}

QuestionStepClean _$QuestionStepFromJson(Map<String, dynamic> json) => QuestionStepClean(
  isOptional: json['isOptional'] as bool? ?? false,
  buttonText: json['buttonText'] as String? ?? 'Next',
  stepIdentifier: json['stepIdentifier'] == null
      ? null
      : StepIdentifier.fromJson(
      json['stepIdentifier'] as Map<String, dynamic>),
  showAppBar: json['showAppBar'] as bool? ?? true,
  title: json['title'] as String? ?? '',
  text: json['text'] as String? ?? '',
  answerFormat:
  AnswerFormat.fromJson(json['answerFormat'] as Map<String, dynamic>),
);

Map<String, dynamic> _$QuestionStepToJson(QuestionStepClean instance) =>
    <String, dynamic>{
      'stepIdentifier': instance.stepIdentifier,
      'isOptional': instance.isOptional,
      'buttonText': instance.buttonText,
      'showAppBar': instance.showAppBar,
      'title': instance.title,
      'text': instance.text,
      'answerFormat': instance.answerFormat,
    };