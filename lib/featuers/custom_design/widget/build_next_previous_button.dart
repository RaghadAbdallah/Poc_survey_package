import 'package:flutter/material.dart';

class NextPreviousBody extends StatelessWidget {
  const NextPreviousBody(
      {super.key,
      required this.isEnabled,
      required this.onPressedNext,
      required this.isFinal,
  });

  final bool isEnabled;
  final VoidCallback? onPressedNext;
  final bool isFinal;


  @override
  Widget build(BuildContext context) {
    return
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 22.0),
          child: OutlinedButton(

            onPressed: isEnabled ? onPressedNext : null,
            child: Text(
              isFinal?'  تأكيد':'  التالي  ',
              style: TextStyle(
                fontSize: 17,
                color: isEnabled ? Colors.teal : Colors.grey,

              ),
            ),
          ),
        );

  }
}
