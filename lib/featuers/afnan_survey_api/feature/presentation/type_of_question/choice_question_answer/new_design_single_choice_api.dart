import 'package:flutter/material.dart';
 import '../../../data/model/new_survey_model.dart';

class NewSingleChoiceDesignApi extends StatefulWidget {
  const NewSingleChoiceDesignApi({super.key, required this.surveyModel});

  final StepApi surveyModel;

  @override
  State<NewSingleChoiceDesignApi> createState() =>
      _NewSingleChoiceDesignApiState();
}

class _NewSingleChoiceDesignApiState extends State<NewSingleChoiceDesignApi> {
  QuestionsResultSurveyList? _selectedChoice;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
        children: (widget.surveyModel.answerFormat?.questionsResultSurveyList ?? []).map((item) {
          return RadioListTile(
            title: Align(
              alignment: const Alignment(1.1, 0),
              child: Text(item.answerDesc ?? ''),
            ),
            value: item,
            groupValue: _selectedChoice,
            onChanged: (value) {
              setState(() {
                _selectedChoice = value as QuestionsResultSurveyList?;
              });
            },
            selected: _selectedChoice == item,
            controlAffinity: ListTileControlAffinity.trailing,
          );
        }).toList(),
      ),
    );
  }

}
