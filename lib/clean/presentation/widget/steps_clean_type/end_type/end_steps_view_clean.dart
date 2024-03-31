import 'package:flutter/material.dart';
import 'package:poc_itg_survey/clean/model/input_format_model/input_answer_model.dart';
import 'package:poc_itg_survey/clean/presentation/widget/steps_clean_type/end_type/end_steps_model.dart';
import 'package:poc_itg_survey/clean/presentation/widget/steps_clean/steps_view_clean.dart';

class EndStepsViewClean extends StatelessWidget {
  final CompletionStepClean completionStep;
  final String assetPath;

  const EndStepsViewClean(
      {super.key, required this.completionStep, this.assetPath = ""});

  @override
  Widget build(BuildContext context) {
    return StepViewClean(
        step: completionStep,
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
        title: Text(completionStep.title,
            style: Theme.of(context).textTheme.displayMedium),
        resultFunction: () => InputQuestionResult(
              id: completionStep.stepIdentifier,
              result: null,
              valueIdentifier: '',
            ));
  }
}
