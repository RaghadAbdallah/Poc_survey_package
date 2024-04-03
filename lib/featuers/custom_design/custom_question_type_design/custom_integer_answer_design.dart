import 'package:flutter/material.dart';

class CustomIntegerAnswerDesign extends StatefulWidget {
  const CustomIntegerAnswerDesign({super.key, required this.questionDesc});

  final String questionDesc;

  @override
  State<CustomIntegerAnswerDesign> createState() =>
      _CustomIntegerAnswerDesignState();
}

class _CustomIntegerAnswerDesignState extends State<CustomIntegerAnswerDesign> {
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
                child: Column(children: [
      Text(
        widget.questionDesc,
        style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 20),
        textAlign: TextAlign.center,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          textInputAction: TextInputAction.next,
          autofocus: true,
          controller: _controller,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11.0),
              borderSide: BorderSide(
                color: Colors.teal,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11.0),
              borderSide: BorderSide(
                color: Colors.teal,
              ),
            ),
          ),
          onChanged: (String value) {
            //  _checkValidation(value);
            //Utilities().checkValidation();
          },
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
        ),
      )
    ]))));
  }
}
