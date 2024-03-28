import 'package:flutter/material.dart';
import 'package:poc_itg_survey/clean/presentation/widget/steps_clean_type/question_type/question_step_clean.dart';
import 'package:poc_itg_survey/clean/presentation/widget/steps_view_clean.dart';
import '../../../../../../../featuers/presentation/type_of_answer/integer_answer_format.dart';
import '../../../../../../model/input_format_model/input_answer_model.dart';

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

  bool _isValid = false;

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
      child: TextField(
        textInputAction: TextInputAction.next,
        autofocus: true,

        controller: _controller,
        onChanged: (String value) {
          _checkValidation(value);
        },
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
      ),
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
      ) );
  }
}
