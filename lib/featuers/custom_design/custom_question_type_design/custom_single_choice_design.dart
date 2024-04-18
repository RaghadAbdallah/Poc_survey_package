import 'package:flutter/material.dart';
import '../entities/choice_item.dart';

class CustomSingleChoiceDesign extends StatefulWidget {
  CustomSingleChoiceDesign(
      {super.key,
      required this.questionDesc,
      required this.choiceList,
      required this.answerStatus});

  List<ChoiceItem> choiceList;
  final String questionDesc;
  final int answerStatus;

  @override
  State<CustomSingleChoiceDesign> createState() =>
      _CustomSingleChoiceDesignState();
}

class _CustomSingleChoiceDesignState extends State<CustomSingleChoiceDesign> {
  dynamic _selectedChoice;
  String selectId = '';

  @override
  Widget build(BuildContext context) {
    if (widget.answerStatus == 1) {
      _selectedChoice = widget.choiceList.firstWhere(
        (choice) => choice.optionStatus == 1,
      );
    }
    return SizedBox.expand(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.questionDesc,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Column(
                children: widget.choiceList.map<Widget>((choice) {
                  return Column(
                    children: [
                      // RadioListTile(
                      //   activeColor: widget.answerStatus == 1
                      //       ? Colors.grey
                      //       : Colors.teal,
                      //   title: Align(
                      //       alignment: const Alignment(1.1, 0),
                      //       child: Text(choice.title.toString())),
                      //   value: choice,
                      //   groupValue: _selectedChoice,
                      //   onChanged: (selectedValue) {
                      //     if (widget.answerStatus == 1) {
                      //     } else {
                      //       setState(() {
                      //         _selectedChoice = selectedValue;
                      //       });
                      //     }
                      //   },
                      //   controlAffinity: ListTileControlAffinity.trailing,
                      // ),
                      ListTile(
                        title: Text(
                          choice.title.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: selectId == choice.value
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.color,
                              ),
                        ),
                        trailing: selectId == choice.value
                            ? Icon(
                                Icons.check,
                                size: 32,
                                color: selectId == choice.value
                                    ? Theme.of(context).primaryColor
                                    : Colors.black,
                              )
                            : Container(
                                width: 32,
                                height: 32,
                              ),
                        onTap: () {
                          setState(() {
                            selectId = choice.value;
                          });
                        },
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                    ],
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
