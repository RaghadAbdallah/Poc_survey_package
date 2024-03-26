import 'package:flutter/material.dart';
import 'package:poc_itg_survey/core/widget/step_view.dart';
import 'package:lottie/lottie.dart';
import '../../data/model/completion_step.dart';
import '../../data/model/completion_step_result.dart';
 class CompletionView extends StatelessWidget {
  final CompletionStep completionStep;
  final DateTime _startDate = DateTime.now();
  final String assetPath;

  CompletionView({required this.completionStep, this.assetPath = ""});

  @override
  Widget build(BuildContext context) {
    return StepView(
      step: completionStep,
      resultFunction: () => CompletionStepResult(
        completionStep.stepIdentifier,

      ),
      title: Text(completionStep.title,
          style: Theme.of(context).textTheme.displayMedium),
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
      ),
    );
  }
}
