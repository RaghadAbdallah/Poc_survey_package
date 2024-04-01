import 'package:flutter/material.dart';
import '../../steps_clean/steps_view_clean.dart';
import 'instruction_step.dart';
import 'instruction_step_result.dart';


class InstructionViewClean extends StatelessWidget {
  final InstructionStepClean instructionStep;

  InstructionViewClean({required this.instructionStep});

  @override
  Widget build(BuildContext context) {
    return StepViewClean(
      step: instructionStep,
      title: Text(
        instructionStep.title,
        style: Theme.of(context).textTheme.displayMedium,
        textAlign: TextAlign.center,
      ),
      resultFunction: () => InstructionStepResultClean(
        instructionStep.stepIdentifier,

      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Text(
          instructionStep.text,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}