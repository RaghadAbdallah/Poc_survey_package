// import 'package:flutter/material.dart';
// import 'package:poc_itg_survey/featuers/poc_survey_feature/presentation/widget/question_type/question_step_clean.dart';
// import '../../../../../data/model/input_answer_model.dart';
// import '../../../../../data/model/type_of_answer/single_choice_answer_format.dart';
// import '../../../../../data/model/type_of_answer/text_choice.dart';
// import '../../../steps_clean/steps_view_clean.dart';
//
// class NewSingleChoiceDesign extends StatefulWidget {
//   const NewSingleChoiceDesign(
//       {super.key, required this.questionStep, required this.result});
//
//   final QuestionStepClean questionStep;
//   final InputQuestionResult? result;
//
//   @override
//   State<NewSingleChoiceDesign> createState() => _NewSingleChoiceDesignState();
// }
//
// class _NewSingleChoiceDesignState extends State<NewSingleChoiceDesign> {
//   TextChoice? _selectedChoice;
//   late final SingleChoiceAnswerFormat _singleChoiceAnswerFormat;
//
//   @override
//   void initState() {
//     super.initState();
//     _singleChoiceAnswerFormat =
//     widget.questionStep.answerFormat as SingleChoiceAnswerFormat;
//     _selectedChoice =
//         widget.result?.result ?? _singleChoiceAnswerFormat.defaultSelection;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return StepViewClean(
//       step: widget.questionStep,
//       title: widget.questionStep.title.isNotEmpty
//           ? Text(
//         widget.questionStep.title,
//         style: Theme
//             .of(context)
//             .textTheme
//             .displayMedium,
//         textAlign: TextAlign.center,
//       )
//           : widget.questionStep.content,
//       resultFunction: () => InputQuestionResult(
//         id: widget.questionStep.stepIdentifier,
//         valueIdentifier: _selectedChoice?.value ?? '',
//         result: _selectedChoice,
//       ),
//       child: Column(
//         children: _singleChoiceAnswerFormat.textChoices.map(
//               (TextChoice tc) {
//             return RadioListTile(
//               title: Align(
//                 alignment: const Alignment(1.1, 0),
//                 child: Text(tc.text),
//               ),
//               value: tc,
//               groupValue: _selectedChoice,
//               onChanged: (TextChoice? value) {
//                 setState(() {
//                   _selectedChoice = value;
//                 });
//               },
//               selected: _selectedChoice == tc,
//               controlAffinity: ListTileControlAffinity.trailing,
//             );
//           },
//         ).toList(),
//       ),
//     );
//   }
// }
