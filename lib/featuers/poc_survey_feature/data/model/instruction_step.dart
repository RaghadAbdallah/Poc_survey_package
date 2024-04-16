import 'package:flutter/material.dart';
import 'step_identifer.dart';
import 'input_answer_model.dart';
import '../../presentation/widget/steps_clean/steps_clean.dart';
import '../../presentation/widget/instruction_view_clean.dart';
class InstructionStepClean extends StepClean {
  final String title;
  final String text;

  InstructionStepClean({
    required this.title,
    required this.text,
    String buttonText = 'Next',
    StepIdentifier? stepIdentifier,
    bool? showProgress,
    bool showAppBar = true,
  }) : super(
          stepIdentifier: stepIdentifier,
        );

  @override
  Widget createView({required InputQuestionResult? questionResult}) {
    return InstructionViewClean(
      instructionStep: this,
    );
  }

  factory InstructionStepClean.fromJson(Map<String, dynamic> json) =>
      _$InstructionStepFromJson(json);

  Map<String, dynamic> toJson() => _$InstructionStepToJson(this);

  bool operator ==(o) =>
      super == (o) &&
      o is InstructionStepClean &&
      o.title == title &&
      o.text == text;

  int get hashCode => super.hashCode ^ title.hashCode ^ text.hashCode;
}

InstructionStepClean _$InstructionStepFromJson(Map<String, dynamic> json) =>
    InstructionStepClean(
      title: json['introSurvey'] as String,
      text: json['text'] as String,
      buttonText: json['buttonText'] as String? ?? 'Next',
      stepIdentifier: json['stepIdentifier'] == null
          ? null
          : StepIdentifier.fromJson(
              json['stepIdentifier'] as Map<String, dynamic>),
      showProgress: json['showProgress'] as bool?,
      showAppBar: json['showAppBar'] as bool? ?? true,
    );

Map<String, dynamic> _$InstructionStepToJson(InstructionStepClean instance) =>
    <String, dynamic>{
      'stepIdentifier': instance.stepIdentifier.toJson(),
      'isOptional': instance.isOptional,
      'title': instance.title,
      'text': instance.text,
    };
