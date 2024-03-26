import 'package:flutter/material.dart';
import 'package:poc_itg_survey/core/widget/selection_list_tile.dart';
import 'package:poc_itg_survey/core/widget/step_view.dart';

import '../../data/model/type_of_questions/bool_question_result.dart';
import '../type_of_answer/boolean_answer_format.dart';
import '../step/question_step.dart';

class BoolView extends StatefulWidget {
  final QuestionStep questionStep;
  final BooleanQuestionResult? result;

  const BoolView({
    Key? key,
    required this.questionStep,
    required this.result,
  }) : super(key: key);

  @override
  _BoolViewState createState() => _BoolViewState();
}

class _BoolViewState extends State<BoolView> {
  late final BooleanAnswerFormat _answerFormat;

  BooleanResult? _result;

  @override
  void initState() {
    super.initState();
    _answerFormat = widget.questionStep.answerFormat as BooleanAnswerFormat;
    _result = widget.result?.result ?? _answerFormat.result;

  }

  @override
  Widget build(BuildContext context) {
    return StepView(
      step: widget.questionStep,
      resultFunction: () => BooleanQuestionResult(
        id: widget.questionStep.stepIdentifier,

        valueIdentifier: _result == BooleanResult.POSITIVE
            ? _answerFormat.positiveAnswer
            : _result == BooleanResult.NEGATIVE
            ? _answerFormat.negativeAnswer
            : '',
        result: _result,
      ),
      title: widget.questionStep.title.isNotEmpty
          ? Text(
        widget.questionStep.title,
        style: Theme.of(context).textTheme.displayMedium,
        textAlign: TextAlign.center,
      )
          : widget.questionStep.content,
      isValid: widget.questionStep.isOptional ||
          (_result != BooleanResult.NONE && _result != null),
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
              const Divider(
                color: Colors.grey,
              ),
              ListTileWidget(
                text: _answerFormat.positiveAnswer,
                onTap: () {
                  if (_result == BooleanResult.POSITIVE) {
                    _result = null;
                  } else {
                    _result = BooleanResult.POSITIVE;
                  }
                  setState(() {});
                },
                isSelected: _result == BooleanResult.POSITIVE,
              ),
              ListTileWidget(
                text: _answerFormat.negativeAnswer,
                onTap: () {
                  if (_result == BooleanResult.NEGATIVE) {
                    _result = null;
                  } else {
                    _result = BooleanResult.NEGATIVE;
                  }
                  setState(() {});
                },
                isSelected: _result == BooleanResult.NEGATIVE,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
