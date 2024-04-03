// import 'package:flutter/material.dart';
// import 'package:poc_itg_survey/featuers/poc_survey_feature/presentation/widget/question_type/question_step_clean.dart';
//
// import '../../../../../../../core/resource/utilities.dart';
// import '../../../../../data/model/input_answer_model.dart';
// import '../../../../../data/model/type_of_answer/integer_answer_format.dart';
// import '../../../steps_clean/steps_view_clean.dart';
//
// class NewIntegerFormatDesign extends StatefulWidget {
//   const NewIntegerFormatDesign(
//       {super.key, required this.result, required this.questionStep});
//
//   final QuestionStepClean questionStep;
//   final InputQuestionResult? result;
//
//   @override
//   State<NewIntegerFormatDesign> createState() => _NewIntegerFormatDesignState();
// }
//
// class _NewIntegerFormatDesignState extends State<NewIntegerFormatDesign> {
//   late final IntegerAnswerFormat _integerAnswerFormat;
//   late final TextEditingController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _integerAnswerFormat =
//         widget.questionStep.answerFormat as IntegerAnswerFormat;
//     _controller = TextEditingController();
//     _controller.text = widget.result?.result?.toString() ?? '';
//     Utilities().checkValidation();
//     //_checkValidation(_controller.text);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return StepViewClean(
//       step: widget.questionStep,
//       title: widget.questionStep.title.isNotEmpty
//           ? Text(
//               widget.questionStep.title,
//               style: Theme.of(context).textTheme.displayMedium,
//               textAlign: TextAlign.center,
//             )
//           : widget.questionStep.content,
//       resultFunction: () => InputQuestionResult<int>(
//         id: widget.questionStep.stepIdentifier,
//         valueIdentifier: _controller.text,
//         result:
//             int.tryParse(_controller.text) ?? _integerAnswerFormat.defaultValue,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: TextField(
//           textInputAction: TextInputAction.next,
//           autofocus: true,
//           controller: _controller,
//           decoration: InputDecoration(
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(11.0),
//               borderSide: BorderSide(
//                 color: Colors.teal,
//               ),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(11.0),
//               borderSide: BorderSide(
//                 color: Colors.teal,
//               ),
//             ),
//           ),
//           onChanged: (String value) {
//             //  _checkValidation(value);
//             Utilities().checkValidation();
//           },
//           keyboardType: TextInputType.number,
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
// }
