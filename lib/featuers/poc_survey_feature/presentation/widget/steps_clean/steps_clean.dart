import 'package:flutter/material.dart';
import '../../../data/model/step_identifer.dart';
import '../../../data/model/input_answer_model.dart';
import '../../../data/model/end_steps_model.dart';
import '../../../data/model/instruction_step.dart';
import '../question_step_clean.dart';

abstract class StepClean {
  final StepIdentifier stepIdentifier;
  final bool isOptional;
  final bool canGoBack;

  StepClean({
    StepIdentifier? stepIdentifier,
    this.isOptional = false,
    this.canGoBack = true,
  }) : stepIdentifier = stepIdentifier ?? StepIdentifier();

  Widget createView({required InputQuestionResult? questionResult});

  factory StepClean.fromJson(Map<String, dynamic> json) {
    final type = json['type'];
    if (type == 'intro') {
      return InstructionStepClean.fromJson(json);
    } else if (type == 'question') {
      return QuestionStepClean.fromJson(json);
    } else if (type == 'completion') {
     return CompletionStepClean.fromJson(json);
    }
    throw   Exception();
  }

  Map<String, dynamic> toJson();
}