import 'package:flutter/material.dart';

class NextPreviousBody extends StatelessWidget {
  const NextPreviousBody(
      {super.key,
      required this.isEnabled,
      required this.onPressedNext,
  });

  final bool isEnabled;
  final VoidCallback? onPressedNext;

  @override
  Widget build(BuildContext context) {
    return
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 22.0),
          child: OutlinedButton(

            onPressed: isEnabled ? onPressedNext : null,
            child: Text(
              '  Next  ',
              style: TextStyle(
                fontSize: 17,
                color: isEnabled ? Colors.teal : Colors.grey,

              ),
            ),
          ),
        );

  }
}
