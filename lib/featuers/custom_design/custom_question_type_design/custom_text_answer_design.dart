import 'package:flutter/material.dart';

class CustomTextAnswerDesign extends StatefulWidget {
  const CustomTextAnswerDesign({super.key,required this.questionDesc});
final String questionDesc;
  @override
  State<CustomTextAnswerDesign> createState() => _CustomTextAnswerDesignState();
}

class _CustomTextAnswerDesignState extends State<CustomTextAnswerDesign> {
  late final TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
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
