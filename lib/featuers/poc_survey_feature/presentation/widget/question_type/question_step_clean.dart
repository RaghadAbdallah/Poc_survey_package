import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/data/model/step_identifer.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/presentation/widget/question_type/type_of_question/choice_question_answer/new_design_single_choice_view.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/presentation/widget/question_type/type_of_question/input_question_answer/new_integer_design.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/presentation/widget/question_type/type_of_question/input_question_answer/new_text_design.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/presentation/widget/question_type/type_of_question/rating_question_answer/slider_new_design_poll.dart';
import '../../../../custom_design/custom_question_type_design/custom_integer_answer_design.dart';
import '../../../../custom_design/custom_question_type_design/custom_multiple_choice_design.dart';
import '../../../../custom_design/custom_question_type_design/custom_single_choice_design.dart';
import '../../../../custom_design/custom_question_type_design/custom_slider_poll_design.dart';
import '../../../../custom_design/custom_question_type_design/custom_text_answer_design.dart';
import '../../../../custom_design/entities/choice_item.dart';
import '../../../data/model/input_answer_model.dart';
import '../../../data/model/type_of_answer/answer_format.dart';
import '../../../data/model/type_of_answer/integer_answer_format.dart';
import '../../../data/model/type_of_answer/multiple_choice_answer_format.dart';
import '../../../data/model/type_of_answer/scale_answer_format.dart';
import '../../../data/model/type_of_answer/single_choice_answer_format.dart';
import '../../../data/model/type_of_answer/text_answer_format.dart';
import '../steps_clean/steps_clean.dart';
import 'type_of_question/choice_question_answer/new_multiple_desgin.dart';

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
        // return NewIntegerFormatDesign(
        //   questionStep: this,
        //   result: questionResult,
        // );
        return CustomIntegerAnswerDesign(
          questionDesc:title,
        );
      case TextAnswerFormat:
        // return NewDesignTextView(
        //   questionStep: this,
        //   result: questionResult,
        // );
        return CustomTextAnswerDesign(
          questionDesc:title,
        );
      case SingleChoiceAnswerFormat:
        FocusManager.instance.primaryFocus?.unfocus();
        // return NewSingleChoiceDesign(
        //   questionStep: this,
        //   result: questionResult,
        // );
        SingleChoiceAnswerFormat singleChoiceAnswerFormat = this.answerFormat as SingleChoiceAnswerFormat;
        List<ChoiceItem> choiceList = [];
        for (int i = 0; i < singleChoiceAnswerFormat.textChoices.length; i++) {
          choiceList.add(ChoiceItem(
              title: singleChoiceAnswerFormat.textChoices[i].text ?? '',
              value: singleChoiceAnswerFormat.textChoices[i].value));
        }
        return CustomSingleChoiceDesign(
          questionDesc: title,
          choiceList: choiceList,
        );
      case MultipleChoiceAnswerFormat:
        MultipleChoiceAnswerFormat multipleChoiceAnswerFormat = this.answerFormat as MultipleChoiceAnswerFormat;
        List<ChoiceItem> choiceList = []; // يجب أن تكون ChoiceItem بدلاً من bool
        for (int i = 0; i <  multipleChoiceAnswerFormat.textChoices.length ; i++) {
          choiceList.add(ChoiceItem(
              title: multipleChoiceAnswerFormat.textChoices[i].text ?? '',
              value: multipleChoiceAnswerFormat.textChoices[i].value
          ));
        }

        // MultipleChoiceAnswerFormat multipleChoiceAnswerFormat ;
        // List<ChoiceItem> choiceList = []; // يجب أن تكون ChoiceItem بدلاً من bool
        // for (int i = 0; i <  multipleChoiceAnswerFormat.textChoices.length ; i++) {
        //   choiceList.add(ChoiceItem(
        //       title: multipleChoiceAnswerFormat.textChoices[i].text ?? '',
        //       value: multipleChoiceAnswerFormat.textChoices[i].value
        //   ));
        // }
        return CustomMultipleChoiceDesign(
          questionDesc: title,
          choiceList: choiceList,
        );
      case ScaleAnswerFormat:
        late final ScaleAnswerFormat _scaleAnswerFormat;
        late double _sliderValue;

          _scaleAnswerFormat =  answerFormat as ScaleAnswerFormat;
          _sliderValue = _scaleAnswerFormat.defaultValue;


        return CustomSliderPollDesign(
          questionDesc: title,
          maxValue: _scaleAnswerFormat.maximumValue,
          minValue: _scaleAnswerFormat.minimumValue,
          stepValue: (_scaleAnswerFormat.maximumValue -
              _scaleAnswerFormat.minimumValue) /
              _scaleAnswerFormat.step,
        );
      default:
        throw Exception();
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
