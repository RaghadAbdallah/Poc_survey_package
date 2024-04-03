import 'package:flutter/material.dart';

class NextPreviousBody extends StatelessWidget {
  const NextPreviousBody(
      {super.key,
      required this.isEnabled,
      required this.onPressed});

  final bool isEnabled;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: OutlinedButton(
            onPressed: isEnabled ? onPressed : null,
            child: Text(
              'previous',
              style: TextStyle(
                color: isEnabled ? Theme.of(context).primaryColor : Colors.grey,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: OutlinedButton(
            onPressed: isEnabled ? onPressed : null,
            child: Text(
              'next',
              style: TextStyle(
                color: isEnabled ? Theme.of(context).primaryColor : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
