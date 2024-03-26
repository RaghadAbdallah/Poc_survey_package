import 'package:flutter/material.dart';
 import 'package:poc_itg_survey/core/widget/step_view.dart';

import '../../data/model/instruction_step.dart';
import '../../data/model/instruction_step_result.dart';


class InstructionView extends StatelessWidget {
  final InstructionStep instructionStep;

  InstructionView({required this.instructionStep});

  @override
  Widget build(BuildContext context) {
    return StepView(
      step: instructionStep,
      title: Text(
        instructionStep.title,
        style: Theme.of(context).textTheme.displayMedium,
        textAlign: TextAlign.center,
      ),
      resultFunction: () => InstructionStepResult(
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
