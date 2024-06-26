import 'package:flutter/material.dart';
import 'package:poc_itg_survey/clean/presentation/widget/steps_clean_type/question_type/question_step_clean.dart';
import 'package:poc_itg_survey/clean/presentation/widget/steps_clean/steps_view_clean.dart';

import '../../../../../../../featuers/presentation/type_of_answer/text_answer_format.dart';
import '../../../../../../model/input_format_model/input_answer_model.dart';

class TextFormatViewClean extends StatefulWidget {
  const TextFormatViewClean(
      {super.key, required this.result, required this.questionStep});

  final QuestionStepClean questionStep;
  final InputQuestionResult? result;

  @override
  State<TextFormatViewClean> createState() => _TextFormatViewCleanState();
}

class _TextFormatViewCleanState extends State<TextFormatViewClean> {
  late final TextAnswerFormat _textAnswerFormat;

  late final TextEditingController _controller;
  bool _isValid = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.text = widget.result?.result ?? '';
    _textAnswerFormat = widget.questionStep.answerFormat as TextAnswerFormat;
    _checkValidation(_controller.text);
  }

  void _checkValidation(String text) {}

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StepViewClean(
        step: widget.questionStep,
        title: widget.questionStep.title.isNotEmpty
            ? Text(
          widget.questionStep.title,
          style: Theme.of(context).textTheme.displayMedium,
          textAlign: TextAlign.center,
        )
            : widget.questionStep.content,
        resultFunction:() =>  InputQuestionResult<String>(
          id: widget.questionStep.stepIdentifier,
          valueIdentifier: _controller.text,
          result: _controller.text,
        ),
      //  isValid: _isValid || widget.questionStep.isOptional,
        child: Column(
          children: [
            Padding(
              padding:
              const EdgeInsets.only(bottom: 32.0, left: 14.0, right: 14.0),
              child: Text(
                widget.questionStep.text,
                style: const TextStyle(fontSize:14),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50.0,

              child: TextField(
                textInputAction: TextInputAction.next,
                autofocus: true,

                controller: _controller,
                textAlign: TextAlign.center,
                onChanged: (String text) {
                  _checkValidation(text);
                },
              ),
            ),
          ],
        ));
  }
}
