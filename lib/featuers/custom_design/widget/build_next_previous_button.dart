import 'package:flutter/material.dart';

class NextPreviousBody extends StatefulWidget {
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
  State<NextPreviousBody> createState() => _NextPreviousBodyState();
}

class _NextPreviousBodyState extends State<NextPreviousBody> {
   @override
  Widget build(BuildContext context) {


  return   Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          widget.isFirst
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: OutlinedButton(
                    onPressed: widget.isEnabled ? widget.onPressedPrevious : null,
                    child: Text(
                      'previous',
                      style: TextStyle(
                        color: widget.isEnabled
                            ? Colors.teal
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
          widget.isFinal
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: OutlinedButton(
                    onPressed: null,
                    child: Text(
                      'submit',
                      style: TextStyle(
                        color: widget.isEnabled
                            ? Colors.teal
                            : Colors.grey,
                      ),
                    ),
                  ),
                )
              : Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: OutlinedButton(
                    onPressed: widget.isEnabled ? widget.onPressedNext : null,
                    child: Text(
                      '  next  ',
                      style: TextStyle(
                        color: widget.isEnabled
                            ? Colors.teal
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
        ],
      )
 ;
  }
}
