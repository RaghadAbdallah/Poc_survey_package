import 'package:flutter/material.dart';
class CustomTextAnswerDesign extends StatefulWidget {
  const CustomTextAnswerDesign({super.key,required this.questionDesc,required this.answerStatues,
  required this.questionAnswer});
final String questionDesc;
final String questionAnswer;
final int answerStatues;
  @override
  State<CustomTextAnswerDesign> createState() => _CustomTextAnswerDesignState();
}

class _CustomTextAnswerDesignState extends State<CustomTextAnswerDesign> {
    final TextEditingController _controller=TextEditingController();
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    widget.answerStatues==1? _controller.text=widget.questionAnswer:_controller.text='';

  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
     _focusNode.unfocus();
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
                    focusNode: _focusNode,
                    textInputAction: TextInputAction.next,
                    autofocus: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                        borderSide: const BorderSide(
                            color:Colors.teal
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                        borderSide: const BorderSide(
                            color:Colors.teal
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
