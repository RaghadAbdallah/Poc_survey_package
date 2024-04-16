import 'package:flutter/material.dart';

class CustomIntegerAnswerDesign extends StatefulWidget {
  const CustomIntegerAnswerDesign({super.key,
    required this.questionDesc,
    required this.focusNodeInt,
    required this.answerStatues,required this.questionAnswer});

  final String questionDesc;
  final String questionAnswer;
  final int answerStatues;
  final FocusNode focusNodeInt ;
  @override
  State<CustomIntegerAnswerDesign> createState() =>
      _CustomIntegerAnswerDesignState();
}

class _CustomIntegerAnswerDesignState extends State<CustomIntegerAnswerDesign> {
  final TextEditingController _controller=TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.answerStatues==1? _controller.text=widget.questionAnswer:_controller.text='';

  }
  @override
  Widget build(BuildContext context) {
       return GestureDetector(
      onTap: (){
       widget.focusNodeInt.unfocus();
      },
      child: SizedBox.expand(
          child: Center(
              child: SingleChildScrollView(
                  child: Column(children: [
        Text(
          widget.questionDesc,
          style: const TextStyle(fontSize: 18,color: Colors.teal),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            focusNode: widget.focusNodeInt,
            textInputAction: TextInputAction.next,
            autofocus: true,
            readOnly:  widget.answerStatues==1?true:false,
            controller: _controller,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11.0),
                borderSide: BorderSide(
                  color:   widget.answerStatues == 1?Colors.grey:Colors.teal,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11.0),
                borderSide: BorderSide(
                  color:   widget.answerStatues == 1?Colors.grey:Colors.teal,
                ),
              ),
            ),
            onChanged: (String value) {
            },
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
          ),
        )
      ])))),
    );
  }
}
