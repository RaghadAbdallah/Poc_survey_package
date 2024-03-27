import 'package:flutter/material.dart';
import 'package:poc_itg_survey/core/widget/step_view.dart';
import '../../../data/model/type_of_questions/double_question_result.dart';
import '../../type_of_answer/double_answer_format.dart';
import '../../step/question_step.dart';

class DoubleAnswerView extends StatefulWidget {
  final QuestionStep questionStep;
  final DoubleQuestionResult? result;

  const DoubleAnswerView({
    Key? key,
    required this.questionStep,
    required this.result,
  }) : super(key: key);

  @override
  _DoubleAnswerViewState createState() => _DoubleAnswerViewState();
}

class _DoubleAnswerViewState extends State<DoubleAnswerView> {
  late final DoubleAnswerFormat _doubleAnswerFormat;
  late final TextEditingController _controller;

  bool _isValid = false;

  @override
  void initState() {
    super.initState();
    _doubleAnswerFormat =
        widget.questionStep.answerFormat as DoubleAnswerFormat;
    _controller = TextEditingController();
    _controller.text = widget.result?.result?.toString() ?? '';
    _checkValidation(_controller.text);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _checkValidation(String text) {
    setState(() {
      _isValid = text.isNotEmpty && double.tryParse(text) != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StepView(
      step: widget.questionStep,
      resultFunction: () => DoubleQuestionResult(
        id: widget.questionStep.stepIdentifier,
        valueIdentifier: _controller.text,
        result: double.tryParse(_controller.text) ??
            _doubleAnswerFormat.defaultValue ??
            null,
      ),
      isValid: _isValid || widget.questionStep.isOptional,
      title: widget.questionStep.title.isNotEmpty
          ? Text(
              widget.questionStep.title,
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            )
          : widget.questionStep.content,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: TextField(
                autofocus: true,
                controller: _controller,
                onChanged: (String value) {
                  _checkValidation(value);
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
