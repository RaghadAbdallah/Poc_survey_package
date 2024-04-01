import 'package:flutter/material.dart';

import '../../../../../../../../core/widget/selection_list_tile.dart';
 import '../../../../../../data/model/input_format_model/input_answer_model.dart';
import '../../../../steps_clean/steps_view_clean.dart';
import '../../../../type_of_answer/boolean_answer_format.dart';
import '../../question_step_clean.dart';

class BooleanViewClean extends StatefulWidget {
  const BooleanViewClean({super.key, required this.questionStep,
    required this.result,});

  final QuestionStepClean questionStep;
  final InputQuestionResult? result;

  @override
  State<BooleanViewClean> createState() => _BooleanViewCleanState();
}

class _BooleanViewCleanState extends State<BooleanViewClean> {
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
    return StepViewClean(step: widget.questionStep,
      resultFunction: () =>
          InputQuestionResult(
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
        style: Theme
            .of(context)
            .textTheme
            .displayMedium,
        textAlign: TextAlign.center,
      )
          : widget.questionStep.content,      isValid: widget.questionStep.isOptional ||
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
      ),);
  }
}
