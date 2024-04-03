import 'package:flutter/material.dart';

class NewIntegerFormatDesign extends StatefulWidget {
  const NewIntegerFormatDesign({super.key, });



  @override
  State<NewIntegerFormatDesign> createState() => _NewIntegerFormatDesignState();
}

class _NewIntegerFormatDesignState extends State<NewIntegerFormatDesign> {
  late final TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  //  Utilities().checkValidation();
    //_checkValidation(_controller.text);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
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
       //   Utilities().checkValidation();
        },
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
      ),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
