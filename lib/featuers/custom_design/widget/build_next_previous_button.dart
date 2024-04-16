import 'package:flutter/material.dart';

class NextPreviousBody extends StatelessWidget {
  const NextPreviousBody(
      {super.key,
      required this.isEnabled,
      required this.onPressedPrevious,
      required this.onPressedNext,
      required this.isFirst,
      required this.isFinal});

  final bool isEnabled;
  final bool isFirst;
  final bool isFinal;
  final VoidCallback? onPressedNext;
  final VoidCallback? onPressedPrevious;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        isFirst
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: OutlinedButton(
                  onPressed: isEnabled ? onPressedPrevious : null,
                  child: Text(
                    'previous',
                    style: TextStyle(
                      color: isEnabled ? Colors.teal : Colors.grey,
                    ),
                  ),
                ),
              ),
        isFinal
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: OutlinedButton(
                  onPressed: null,
                  child: Text(
                    'submit',
                    style: TextStyle(
                      color: isEnabled ? Colors.teal : Colors.grey,
                    ),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: OutlinedButton(
                  onPressed: isEnabled ? onPressedNext : null,
                  child: Text(
                    '  next  ',
                    style: TextStyle(
                      color: isEnabled ? Colors.teal : Colors.grey,
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
