import 'package:flutter/material.dart';

class CustomIntroWidget extends StatelessWidget {
  const CustomIntroWidget({super.key,required this.questionDesc});
  final String questionDesc;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: Center(
            child: Text(
              questionDesc,
              style: const TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )));
  }
}
