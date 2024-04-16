import 'package:flutter/material.dart';
import '../entities/choice_item.dart';

class CustomMultipleChoiceDesign extends StatefulWidget {
    CustomMultipleChoiceDesign(
      {super.key, required this.questionDesc, required this.choiceList,
        required this.answerStatus});

  List<ChoiceItem> choiceList;
  final String questionDesc;
    final int answerStatus;

  @override
  State<CustomMultipleChoiceDesign> createState() =>
      _CustomMultipleChoiceDesignState();
}

class _CustomMultipleChoiceDesignState
    extends State<CustomMultipleChoiceDesign> {

  final List<ChoiceItem> _selectedChoices = [];
  @override
  void initState() {
    super.initState();
    if(widget.answerStatus==1){
      _selectedChoices.addAll(
        widget.choiceList.where((choice) => choice.optionStatus == 1),
      );
    }
  }

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
            style: const TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Column(
            children: widget.choiceList.map<Widget>((choice) {
              return CheckboxListTile(
                selectedTileColor: Colors.teal,
                checkColor: Colors.white,
                activeColor: widget.answerStatus == 1?Colors.grey:Colors.teal,
                 title: Text(choice.title.toString(),style: TextStyle(

                  color: widget.answerStatus == 1?Colors.grey:Colors.black, ),),
                value: _selectedChoices.contains(choice),
                onChanged: (bool? value) {
                  if(widget.answerStatus==1){}else{ setState(() {
                    if (value ?? false) {
                      if (!_selectedChoices.contains(choice)) {
                        _selectedChoices.add(choice);
                      }
                    } else {
                      _selectedChoices.remove(choice);
                    }
                  });}
                },
              );
            }).toList(),
          )

        ],
      ))),
    );
  }
}
