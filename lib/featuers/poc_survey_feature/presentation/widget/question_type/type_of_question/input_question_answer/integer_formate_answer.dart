import 'package:flutter/material.dart';

import '../../../../../data/model/input_answer_model.dart';
import '../../../steps_clean/steps_view_clean.dart';
import '../../../type_of_answer/integer_answer_format.dart';
import '../../question_step_clean.dart';

class IntegerFormatViewClean extends StatefulWidget {
  const IntegerFormatViewClean(
      {super.key, required this.result, required this.questionStep});

  final QuestionStepClean questionStep;
  final InputQuestionResult? result;

  @override
  State<IntegerFormatViewClean> createState() => _IntegerFormatViewState();
}

class _IntegerFormatViewState extends State<IntegerFormatViewClean> {
  late final IntegerAnswerFormat _integerAnswerFormat;
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _integerAnswerFormat =
    widget.questionStep.answerFormat as IntegerAnswerFormat;
    _controller = TextEditingController();
    _controller.text = widget.result?.result?.toString() ?? '';
    _checkValidation(_controller.text);
  }

  void _checkValidation(String text) {}
  @override
  Widget build(BuildContext context) {

    return StepViewClean(
      step: widget.questionStep,
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
      resultFunction:()=>  InputQuestionResult<int>(
        id: widget.questionStep.stepIdentifier,
        valueIdentifier: _controller.text,
        result: int.tryParse(_controller.text) ??
            _integerAnswerFormat.defaultValue,
      ),
      child: TextField(
        textInputAction: TextInputAction.next,
        autofocus: true,

        controller: _controller,
        onChanged: (String value) {
          _checkValidation(value);
        },
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
      ) );
  }
}
