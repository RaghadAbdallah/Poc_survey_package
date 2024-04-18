import 'package:flutter/material.dart';
import 'steps_clean/steps_view_clean.dart';
import '../../data/model/instruction_step.dart';
import '../../data/model/instruction_step_result.dart';


class InstructionViewClean extends StatelessWidget {
  final InstructionStepClean instructionStep;

  const InstructionViewClean({super.key, required this.instructionStep});

  @override
  Widget build(BuildContext context) {
    return StepViewClean(
      step: instructionStep,
      title: Text(
        instructionStep.title,
        style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
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