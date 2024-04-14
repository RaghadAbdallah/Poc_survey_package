import 'package:flutter/material.dart';

import '../entities/choice_item.dart';

class CustomSingleChoiceDesign extends StatefulWidget {
    CustomSingleChoiceDesign(
      {super.key, required this.questionDesc, required this.choiceList});

    List<ChoiceItem> choiceList;
  final String questionDesc;

  @override
  State<CustomSingleChoiceDesign> createState() =>
      _CustomSingleChoiceDesignState();
}

class _CustomSingleChoiceDesignState extends State<CustomSingleChoiceDesign> {
  dynamic _selectedChoice;


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
                children:widget.choiceList.map<Widget>((choice) {
                  return RadioListTile(
                    activeColor: Colors.teal,
                    title: Align(
                      alignment: const Alignment(1.1, 0),
                        child: Text(choice.title.toString())),
                    value: choice,
                    groupValue: _selectedChoice,
                    onChanged: (selectedValue) {
                      setState(() {
                        _selectedChoice = selectedValue;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}


