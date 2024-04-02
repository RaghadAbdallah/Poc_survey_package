import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/data/model/step_identifer.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/presentation/widget/question_type/type_of_question/choice_question_answer/new_design_single_choice_view.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/presentation/widget/question_type/type_of_question/input_question_answer/new_integer_design.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/presentation/widget/question_type/type_of_question/input_question_answer/new_text_design.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/presentation/widget/question_type/type_of_question/rating_question_answer/scale_format_answer.dart';
import '../../../../../core/exception/error_exception.dart';
import '../../../data/model/input_answer_model.dart';
import '../../../data/model/type_of_answer/answer_format.dart';
import '../../../data/model/type_of_answer/integer_answer_format.dart';
import '../../../data/model/type_of_answer/multiple_choice_answer_format.dart';
import '../../../data/model/type_of_answer/scale_answer_format.dart';
import '../../../data/model/type_of_answer/single_choice_answer_format.dart';
import '../../../data/model/type_of_answer/text_answer_format.dart';
import '../steps_clean/steps_clean.dart';
import 'type_of_question/choice_question_answer/new_multiple_desgin.dart';

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
    switch (answerFormat.runtimeType) {
      case IntegerAnswerFormat:
        // return IntegerFormatViewClean(
        //   questionStep: this,
        //   result: questionResult,
        // );
        return NewIntegerFormatDesign(
          questionStep: this,
          result: questionResult,
        );
      case TextAnswerFormat:
        // return TextFormatViewClean(
        //   questionStep: this,
        //   result: questionResult,
        // );
        return NewDesignTextView(
          questionStep: this,
          result: questionResult,
        );
      case SingleChoiceAnswerFormat:
        FocusManager.instance.primaryFocus?.unfocus();
        // return SingleChoiceAnswerViewClean(
        //   questionStep: this,
        //   result: questionResult,
        // );
        return NewSingleChoiceDesign(
          questionStep: this,
          result: questionResult,
        );
      case MultipleChoiceAnswerFormat:
        // return MultipleChoiceAnswerViewClean(
        //   questionStep: this,
        //   result: questionResult,
        // );
        return NewMultipleChoiceDesign(
          questionStep: this,
          result: questionResult,
        );
      case ScaleAnswerFormat:
        return ScaleAnswerViewClean(
          questionStep: this,
          result: questionResult,
        );
      default:
        throw const Exceptions();
    }
  }

  factory QuestionStepClean.fromJson(Map<String, dynamic> json) =>
      _$QuestionStepFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$QuestionStepToJson(this);
}

QuestionStepClean _$QuestionStepFromJson(Map<String, dynamic> json) =>
    QuestionStepClean(
      isOptional: json['isOptional'] as bool? ?? false,
      buttonText: json['buttonText'] as String? ?? 'Next',
      stepIdentifier: json['stepIdentifier'] == null
          ? null
          : StepIdentifier.fromJson(
              json['stepIdentifier'] as Map<String, dynamic>),
      showAppBar: json['showAppBar'] as bool? ?? true,
      title: json['questionDesc'] as String? ?? '',
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
