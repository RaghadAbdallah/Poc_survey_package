 import 'package:flutter/material.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/data/model/step_identifer.dart';
    import '../../../custom_design/custom_question_type_design/custom_integer_answer_design.dart';
import '../../../custom_design/custom_question_type_design/custom_multiple_choice_design.dart';
import '../../../custom_design/custom_question_type_design/custom_single_choice_design.dart';
import '../../../custom_design/custom_question_type_design/custom_slider_poll_design.dart';
import '../../../custom_design/custom_question_type_design/custom_text_answer_design.dart';
import '../../../custom_design/entities/choice_item.dart';
import '../../data/model/input_answer_model.dart';
import '../../data/model/type_of_answer/answer_format.dart';
import '../../data/model/type_of_answer/integer_answer_format.dart';
import '../../data/model/type_of_answer/multiple_choice_answer_format.dart';
import '../../data/model/type_of_answer/scale_answer_format.dart';
import '../../data/model/type_of_answer/single_choice_answer_format.dart';
import '../../data/model/type_of_answer/text_answer_format.dart';
import 'steps_clean/steps_clean.dart';

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
 final FocusNode  focusNode = FocusNode();
 final FocusNode  focusNodeInt = FocusNode();
  @override
  Widget createView({required InputQuestionResult? questionResult}) {
    switch (answerFormat.runtimeType) {
      case IntegerAnswerFormat:
        return CustomIntegerAnswerDesign(
          questionDesc:title, answerStatues: 0, questionAnswer: "",
        );
      case TextAnswerFormat:
        return CustomTextAnswerDesign(
          questionDesc:title, answerStatues: 0, questionAnswer: "",
        );
      case SingleChoiceAnswerFormat:
        FocusManager.instance.primaryFocus?.unfocus();
        SingleChoiceAnswerFormat singleChoiceAnswerFormat = this.answerFormat as SingleChoiceAnswerFormat;
        List<ChoiceItem> choiceList = [];
        for (int i = 0; i < singleChoiceAnswerFormat.textChoices.length; i++) {
          choiceList.add(ChoiceItem(
              title: singleChoiceAnswerFormat.textChoices[i].text ?? '',
              value: singleChoiceAnswerFormat.textChoices[i].value,
              optionStatus:singleChoiceAnswerFormat.textChoices[i].optionValue));
        }
        return CustomSingleChoiceDesign(
          questionDesc: title,
          choiceList: choiceList, answerStatus: 0,
        );
      case MultipleChoiceAnswerFormat:
        MultipleChoiceAnswerFormat multipleChoiceAnswerFormat = this.answerFormat as MultipleChoiceAnswerFormat;
        List<ChoiceItem> choiceList = []; // يجب أن تكون ChoiceItem بدلاً من bool
        for (int i = 0; i <  multipleChoiceAnswerFormat.textChoices.length ; i++) {
          choiceList.add(ChoiceItem(
              title: multipleChoiceAnswerFormat.textChoices[i].text ?? '',
              value: multipleChoiceAnswerFormat.textChoices[i].value,
            optionStatus: multipleChoiceAnswerFormat.textChoices[i].optionValue,
          ));
        }
        return CustomMultipleChoiceDesign(
          questionDesc: title,
          choiceList: choiceList,
          answerStatus: 0,
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
          stepValue:
              _scaleAnswerFormat.step, answerStatus: 0, answerValue: 0.0,
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
