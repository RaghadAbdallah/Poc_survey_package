import 'package:flutter/material.dart';
import '../../../data/model/input_answer_model.dart';
import 'steps_view_clean.dart';
import '../../../data/model/end_steps_model.dart';

class EndStepsViewClean extends StatelessWidget {
  final CompletionStepClean completionStep;
  final String assetPath;

  const EndStepsViewClean(
      {super.key, required this.completionStep, this.assetPath = ""});

  @override
  Widget build(BuildContext context) {
    return StepViewClean(
        step: completionStep,
        title: Text(completionStep.title,
            style: Theme.of(context).textTheme.displayMedium),
        resultFunction: () => InputQuestionResult(
              id: completionStep.stepIdentifier,
              result: null,
              valueIdentifier: '',
            ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64.0),
          child: Column(
            children: [
              Text(
                completionStep.text,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}
