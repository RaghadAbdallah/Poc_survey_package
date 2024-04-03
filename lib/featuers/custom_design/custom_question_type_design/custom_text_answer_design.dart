import 'package:flutter/material.dart';

class CustomTextAnswerDesign extends StatefulWidget {
  const CustomTextAnswerDesign({super.key,required this.questionDesc});
final String questionDesc;
  @override
  State<CustomTextAnswerDesign> createState() => _CustomTextAnswerDesignState();
}

class _CustomTextAnswerDesignState extends State<CustomTextAnswerDesign> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                widget.questionDesc,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  autofocus: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11.0),
                      borderSide: BorderSide(
                          color:Colors.teal
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11.0),
                      borderSide: BorderSide(
                          color:Colors.teal
                      ),
                    ),
                  ),
                  controller: _controller,
                  textAlign: TextAlign.center,
                  onChanged: (String text) {
                    // _checkValidation(text);
                    //Utilities().checkValidation();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
