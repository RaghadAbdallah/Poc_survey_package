import 'package:flutter/material.dart';
import 'package:poc_itg_survey/clean/model/input_format_model/input_answer_model.dart';
import 'package:poc_itg_survey/clean/presentation/widget/steps_clean_type/question_type/question_step_clean.dart';
import 'package:poc_itg_survey/clean/presentation/widget/steps_clean/steps_view_clean.dart';
import 'package:poc_itg_survey/core/widget/selection_list_tile.dart';

import '../../../../../../../featuers/presentation/type_of_answer/single_choice_answer_format.dart';
import '../../../../../../../featuers/presentation/type_of_answer/text_choice.dart';

class SingleChoiceAnswerViewClean extends StatefulWidget {
  const SingleChoiceAnswerViewClean({super.key, required this.questionStep,
    required this.result,});

  final QuestionStepClean questionStep;
  final InputQuestionResult? result;

  @override
  State<SingleChoiceAnswerViewClean> createState() =>
      _SingleChoiceAnswerViewCleanState();
}

class _SingleChoiceAnswerViewCleanState
    extends State<SingleChoiceAnswerViewClean> {
  late final SingleChoiceAnswerFormat _singleChoiceAnswerFormat;
  TextChoice? _selectedChoice;

  @override
  void initState() {
    super.initState();
    _singleChoiceAnswerFormat =
    widget.questionStep.answerFormat as SingleChoiceAnswerFormat;
    _selectedChoice =
        widget.result?.result ?? _singleChoiceAnswerFormat.defaultSelection;
  }

  @override
  Widget build(BuildContext context) {
    return StepViewClean(
      step: widget.questionStep,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Text(
                widget.questionStep.text,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            Column(
              children: [
                Divider(
                  color: Colors.grey,
                ),
                ..._singleChoiceAnswerFormat.textChoices.map(
                      (TextChoice tc) {
                    return ListTileWidget(
                      text: tc.text,
                      onTap: () {
                        if (_selectedChoice == tc) {
                          _selectedChoice = null;
                        } else {
                          _selectedChoice = tc;
                        }
                        setState(() {});
                      },
                      isSelected: _selectedChoice == tc,
                    );
                  },
                ).toList(),
              ],
            ),
          ],
        ),
      ),
      // isValid: widget.questionStep.isOptional || _selectedChoice != null,
      title: widget.questionStep.title.isNotEmpty
          ? Text(
        widget.questionStep.title,
        style: Theme
            .of(context)
            .textTheme
            .displayMedium,
        textAlign: TextAlign.center,
      )
          : widget.questionStep.content,
      resultFunction: () =>
          InputQuestionResult(
            id: widget.questionStep.stepIdentifier,
            valueIdentifier: _selectedChoice?.value ?? '',
            result: _selectedChoice,
          ),);
  }
}
