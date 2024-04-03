import 'package:flutter/material.dart';

class OnTapWidget extends StatelessWidget {
  const OnTapWidget(
      {super.key,
      required this.onTapFunction,
      required this.buttonTitle,});

  final void Function() onTapFunction;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunction,
      child: Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(
            color: Colors.black),
            borderRadius: BorderRadius.circular(  0.2),
          ),
          child: Center(
            child:Text(buttonTitle)
          )),
    );
  }
}
