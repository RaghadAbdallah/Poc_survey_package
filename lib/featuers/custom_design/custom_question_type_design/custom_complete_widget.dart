import 'package:flutter/material.dart';

class CustomCompleteWidget extends StatelessWidget {
  const CustomCompleteWidget(
      {super.key, required this.text, required this.title});

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: Center(
            child:
      Text(
        text,
        style: const TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),

     ));
  }
}
