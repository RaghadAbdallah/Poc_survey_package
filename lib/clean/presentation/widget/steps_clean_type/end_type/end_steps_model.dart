import 'package:json_annotation/json_annotation.dart';
import 'package:poc_itg_survey/clean/model/input_format_model/input_answer_model.dart';
import 'package:poc_itg_survey/clean/presentation/widget/steps_clean/steps_clean.dart';
import 'package:flutter/material.dart';
import '../../../../../featuers/presentation/step/step_identifer.dart';
import 'end_steps_view_clean.dart';

@JsonSerializable()
class CompletionStepClean extends StepClean {
  final String title;
  final String text;

  CompletionStepClean({
    bool isOptional = false,
    required StepIdentifier stepIdentifier,
    String buttonText = 'End Survey',
    bool showAppBar = true,
    required this.title,
    required this.text,
  }) : super(
    stepIdentifier: stepIdentifier,
    isOptional: isOptional,
    buttonText: buttonText,
    showAppBar: showAppBar,
  );

  @override
  Widget createView({required InputQuestionResult? questionResult}) {
    return EndStepsViewClean(completionStep: this );
  }

  factory CompletionStepClean.fromJson(Map<String, dynamic> json) =>
      _$CompletionStepFromJson(json);
  Map<String, dynamic> toJson() => _$CompletionStepToJson(this);

  bool operator ==(o) =>
      super == (o) && o is CompletionStepClean && o.title == title && o.text == text;
  int get hashCode => super.hashCode ^ title.hashCode ^ text.hashCode;
}

CompletionStepClean _$CompletionStepFromJson(Map<String, dynamic> json) =>
    CompletionStepClean(
      isOptional: json['isOptional'] as bool? ?? false,
      stepIdentifier: StepIdentifier.fromJson(
          json['stepIdentifier'] as Map<String, dynamic>),
      buttonText: json['buttonText'] as String? ?? 'Next',
      showAppBar: json['showAppBar'] as bool? ?? true,
      title: json['title'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$CompletionStepToJson(CompletionStepClean instance) =>
    <String, dynamic>{
      'stepIdentifier': instance.stepIdentifier,
      'isOptional': instance.isOptional,
      'buttonText': instance.buttonText,
      'showAppBar': instance.showAppBar,
      'title': instance.title,
      'text': instance.text,
    };