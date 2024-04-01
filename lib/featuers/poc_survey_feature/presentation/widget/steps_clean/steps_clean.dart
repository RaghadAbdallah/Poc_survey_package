import 'package:flutter/material.dart';
import '../../../data/model/step_identifer.dart';
import '../../../data/model/input_format_model/input_answer_model.dart';
import '../steps_clean_type/end_type/end_steps_model.dart';
import '../steps_clean_type/instruction_type/instruction_step.dart';
import '../steps_clean_type/question_type/question_step_clean.dart';

abstract class StepClean {
  final StepIdentifier stepIdentifier;
  final bool isOptional;
  final String? buttonText;
  final bool canGoBack;
  final bool showProgress;
  final bool showAppBar;

  StepClean({
    StepIdentifier? stepIdentifier,
    this.isOptional = false,
    this.buttonText = 'Next',
    this.canGoBack = true,
    this.showProgress = true,
    this.showAppBar = true,
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
    throw StepNotDefinedException();
  }

  Map<String, dynamic> toJson();

bool operator ==(o) =>
    o is StepClean &&
        o.stepIdentifier == stepIdentifier &&
        o.isOptional == isOptional &&
        o.buttonText == buttonText;
int get hashCode =>
    stepIdentifier.hashCode ^ isOptional.hashCode ^ buttonText.hashCode;
}
class StepNotDefinedException implements Exception {
  const StepNotDefinedException() : super();
}