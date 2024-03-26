import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poc_itg_survey/featuers/presentation/step/step.dart';
import 'package:poc_itg_survey/featuers/presentation/step/step_identifer.dart';

import 'question_result.dart';
import '../../presentation/format_answer_view/completion_view.dart';

@JsonSerializable()
class CompletionStep extends Step {
  final String title;
  final String text;

  CompletionStep({
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
  Widget createView({required QuestionResult? questionResult}) {
    return CompletionView(completionStep: this );
  }

  factory CompletionStep.fromJson(Map<String, dynamic> json) =>
      _$CompletionStepFromJson(json);
  Map<String, dynamic> toJson() => _$CompletionStepToJson(this);

  bool operator ==(o) =>
      super == (o) && o is CompletionStep && o.title == title && o.text == text;
  int get hashCode => super.hashCode ^ title.hashCode ^ text.hashCode;
}

CompletionStep _$CompletionStepFromJson(Map<String, dynamic> json) =>
    CompletionStep(
      isOptional: json['isOptional'] as bool? ?? false,
      stepIdentifier: StepIdentifier.fromJson(
          json['stepIdentifier'] as Map<String, dynamic>),
      buttonText: json['buttonText'] as String? ?? 'Next',
      showAppBar: json['showAppBar'] as bool? ?? true,
      title: json['title'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$CompletionStepToJson(CompletionStep instance) =>
    <String, dynamic>{
      'stepIdentifier': instance.stepIdentifier,
      'isOptional': instance.isOptional,
      'buttonText': instance.buttonText,
      'showAppBar': instance.showAppBar,
      'title': instance.title,
      'text': instance.text,
    };
