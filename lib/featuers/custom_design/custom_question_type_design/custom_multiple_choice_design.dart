import 'package:flutter/material.dart';

import '../../poc_survey_feature/data/model/type_of_answer/text_choice.dart';
import '../entities/choice_item.dart';

class CustomMultipleChoiceDesign extends StatefulWidget {
    CustomMultipleChoiceDesign(
      {super.key, required this.questionDesc, required this.choiceList});

  List<ChoiceItem> choiceList;
  final String questionDesc;

  @override
  State<CustomMultipleChoiceDesign> createState() =>
      _CustomMultipleChoiceDesignState();
}

class _CustomMultipleChoiceDesignState
    extends State<CustomMultipleChoiceDesign> {

  List<ChoiceItem> _selectedChoices = [];
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Center(
          child: SingleChildScrollView(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.questionDesc,
            style: const TextStyle(fontSize: 18,color: Colors.teal),

            textAlign: TextAlign.center,
          ),
          Column(
            children: widget.choiceList.map<Widget>((choice) {
              return CheckboxListTile(
                checkColor: Colors.white,
                activeColor: Colors.teal,
                title: Text(choice.title.toString()), // تأكد من وجود title في ChoiceItem
                value: _selectedChoices.contains(choice),
                onChanged: (bool? value) {
                  setState(() {
                    if (value ?? false) {
                      if (!_selectedChoices.contains(choice)) {
                        _selectedChoices.add(choice);
                      }
                    } else {
                      _selectedChoices.remove(choice);
                    }
                  });
                },
              );
            }).toList(),
          )

        ],
      ))),
    );
  }
}
