import 'package:flutter/material.dart';
import 'package:poc_itg_survey/core/resource/utilities.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/presentation/widget/question_type/question_step_clean.dart';

import '../../../../../data/model/input_answer_model.dart';
import '../../../steps_clean/steps_view_clean.dart';

class NewDesignTextView extends StatefulWidget {
  const NewDesignTextView({super.key, required this.result, required this.questionStep});

  final QuestionStepClean questionStep;
  final InputQuestionResult? result;

  @override
  State<NewDesignTextView> createState() => _NewDesignTextViewState();
}

class _NewDesignTextViewState extends State<NewDesignTextView> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.text = widget.result?.result ?? '';
    Utilities().checkValidation();
   // _checkValidation(_controller.text);
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
    child:Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        autofocus: true,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11.0),
          borderSide: BorderSide(
            color:Colors.teal
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11.0),
          borderSide: BorderSide(
              color:Colors.teal
          ),
        ),
      ),
        controller: _controller,
        textAlign: TextAlign.center,
        onChanged: (String text) {
         // _checkValidation(text);
          Utilities().checkValidation();
        },
      ),
    ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
