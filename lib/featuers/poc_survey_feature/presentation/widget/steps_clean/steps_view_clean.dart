import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/presentation/widget/steps_clean/steps_clean.dart' as surveyStepClean;
 import '../../../../../core/resource/itg_controller_clean.dart';
import '../../../data/model/input_answer_model.dart';


class StepViewClean extends StatelessWidget {
  final surveyStepClean.StepClean step;
  final Widget title;
  final Widget child;
  final InputQuestionResult Function() resultFunction;
  final bool isValid;
  final ItgSurveyControllerClean? controller;

  const StepViewClean({super.key,
    required this.step,
    required this.child,
    required this.title,
    required this.resultFunction,
    this.controller,
    this.isValid = true,
  });

  @override
  Widget build(BuildContext context) {
    final surveyController = controller ?? context.read<ItgSurveyControllerClean>();

    return SizedBox.expand(
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: title,
                ),
                child,
               // _buildOutlinedButton(context, 'next', isValid || step.isOptional, () => surveyController.nextStep(context, resultFunction)),

                //ازا كان الtype == intro  لازم الباك ما تطلع
                // _buildOutlinedButton(context, 'Back', isValid || step.isOptional, () => _surveyController.backStep(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOutlinedButton(BuildContext context, String text, bool isEnabled, VoidCallback? onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: OutlinedButton(
        onPressed: isEnabled ? onPressed : null,
        child: Text(
          text,
          style: TextStyle(
            color: isEnabled ? Theme.of(context).primaryColor : Colors.grey,
          ),
        ),
      ),
    );
  }
}