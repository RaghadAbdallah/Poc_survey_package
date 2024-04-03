import 'package:flutter/material.dart';

import '../../../data/model/new_survey_model.dart';

class NewMultipleChoiceDesignApi extends StatefulWidget {
  const NewMultipleChoiceDesignApi({super.key, required this.surveyModel});

  final StepApi surveyModel;

  State<NewMultipleChoiceDesignApi> createState() =>
      _NewMultipleChoiceDesignApiState();
}

class _NewMultipleChoiceDesignApiState
    extends State<NewMultipleChoiceDesignApi> {

  List<QuestionsResultSurveyList> _selectedChoices = [];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child:ListView(
        children: (widget.surveyModel.answerFormat?.questionsResultSurveyList ?? []).map((item) {
          return CheckboxListTile(
            title: Text(item.answerDesc ?? ''),
            value: _selectedChoices.contains(item),
            onChanged: (bool? value) {
              setState(() {
                if (value ?? false) {
                  if (!_selectedChoices.contains(item)) {
                    _selectedChoices.add(item);
                  }
                } else {
                  _selectedChoices.remove(item);
                }
              });
            },
            controlAffinity:
            ListTileControlAffinity.trailing,
          );
        }).toList(),
      ),
    );
  }
}
