import 'package:flutter/material.dart';
class CustomTextAnswerDesign extends StatefulWidget {
  const CustomTextAnswerDesign({super.key,required this.questionDesc,
    required this.answerStatues,
    required this.focusNode,
  required this.questionAnswer});
final String questionDesc;
final String questionAnswer;
final int answerStatues;
final FocusNode focusNode ;
  @override
  State<CustomTextAnswerDesign> createState() => _CustomTextAnswerDesignState();
}

class _CustomTextAnswerDesignState extends State<CustomTextAnswerDesign> {
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
        widget.focusNode.unfocus();
      },
      child: SizedBox.expand(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  widget.questionDesc,
                  style: const TextStyle(fontSize: 18,color: Colors.teal),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    focusNode: widget.focusNode,
                    readOnly:  widget.answerStatues==1?true:false,
                    textInputAction: TextInputAction.next,
                    autofocus: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                        borderSide:   BorderSide(
                            color: widget.answerStatues==1?Colors.grey:Colors.teal
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                        borderSide:   BorderSide(
                            color: widget.answerStatues==1?Colors.grey:Colors.teal
                        ),
                      ),
                    ),
                    controller: _controller,
                    textAlign: TextAlign.center,
                    onChanged: (String text) {
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
