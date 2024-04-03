import 'package:flutter/material.dart';

import '../../../data/model/new_survey_model.dart';

class NewDesignTextView extends StatefulWidget {
  const NewDesignTextView({super.key});

  @override
  State<NewDesignTextView> createState() => _NewDesignTextViewState();
}

class _NewDesignTextViewState extends State<NewDesignTextView> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
   // Utilities().checkValidation();
    // _checkValidation(_controller.text);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
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
         // Utilities().checkValidation();
        },
      ),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
