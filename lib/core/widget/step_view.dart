import 'package:flutter/material.dart';
import '../../featuers/presentation/step/step.dart' as surveystep;
import '../../featuers/data/model/question_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/next_back_close_controller.dart';

class StepView extends StatelessWidget {
  final surveystep.Step step;
  final Widget title;
  final Widget child;
  final QuestionResult Function() resultFunction;
  final bool isValid;
  final ItgSurveyController? controller;

  const StepView({
    required this.step,
    required this.child,
    required this.title,
    required this.resultFunction,
    this.controller,
    this.isValid = true,
  });

  @override
  Widget build(BuildContext context) {
    final _surveyController = controller ?? context.read<ItgSurveyController>();

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
                _buildOutlinedButton(context, 'next', isValid || step.isOptional, () => _surveyController.nextStep(context, resultFunction)),

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
