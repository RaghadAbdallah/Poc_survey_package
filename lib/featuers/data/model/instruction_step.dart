import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poc_itg_survey/featuers/presentation/step/step.dart';
import 'package:poc_itg_survey/featuers/presentation/step/step_identifer.dart';

import 'question_result.dart';
import '../../presentation/format_answer_view/instruction_view.dart';

@JsonSerializable(explicitToJson: true)
class InstructionStep extends Step {
  final String title;
  final String text;

  InstructionStep({
    required this.title,
    required this.text,
    String buttonText = 'Next',
    StepIdentifier? stepIdentifier,
    bool? showProgress,
    bool showAppBar = true,
  }) : super(
          stepIdentifier: stepIdentifier,
          buttonText: buttonText,
          showProgress: showProgress ?? false,
          showAppBar: showAppBar,
        );

  @override
  Widget createView({required QuestionResult? questionResult}) {
    return InstructionView(
      instructionStep: this,
    );
  }

  factory InstructionStep.fromJson(Map<String, dynamic> json) =>
      _$InstructionStepFromJson(json);
  Map<String, dynamic> toJson() => _$InstructionStepToJson(this);

  // bool operator ==(o) =>
  //     super == (o) &&
  //     o is InstructionStep &&
  //     o.title == title &&
  //     o.text == text;
  // int get hashCode => super.hashCode ^ title.hashCode ^ text.hashCode;
}

InstructionStep _$InstructionStepFromJson(Map<String, dynamic> json) =>
    InstructionStep(
      title: json['QuestionDesc'] as String,
      text: json['text'] as String,
      buttonText: json['buttonText'] as String? ?? 'Next',
      stepIdentifier: json['stepIdentifier'] == null
          ? null
          : StepIdentifier.fromJson(
          json['stepIdentifier'] as Map<String, dynamic>),
      showProgress: json['showProgress'] as bool?,
      showAppBar: json['showAppBar'] as bool? ?? true,
    );

Map<String, dynamic> _$InstructionStepToJson(InstructionStep instance) =>
    <String, dynamic>{
      'stepIdentifier': instance.stepIdentifier.toJson(),
      'isOptional': instance.isOptional,
      'buttonText': instance.buttonText,
      'showProgress': instance.showProgress,
      'showAppBar': instance.showAppBar,
      'title': instance.title,
      'text': instance.text,
    };
