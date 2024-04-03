// import 'package:flutter/material.dart';
//
// import '../../../../../data/model/input_answer_model.dart';
// import '../../../../../data/model/type_of_answer/multiple_choice_answer_format.dart';
// import '../../../../../data/model/type_of_answer/text_choice.dart';
// import '../../../steps_clean/steps_view_clean.dart';
// import '../../question_step_clean.dart';
//
// class NewMultipleChoiceDesign extends StatefulWidget {
//   const NewMultipleChoiceDesign({
//     super.key,
//     required this.questionStep,
//     required this.result,
//   });
//
//   final QuestionStepClean questionStep;
//   final InputQuestionResult? result;
//
//   @override
//   State<NewMultipleChoiceDesign> createState() =>
//       _NewMultipleChoiceDesignState();
// }
//
// class _NewMultipleChoiceDesignState extends State<NewMultipleChoiceDesign> {
//   late final MultipleChoiceAnswerFormat _multipleChoiceAnswer;
//
//   List<TextChoice> _selectedChoices = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _multipleChoiceAnswer =
//         widget.questionStep.answerFormat as MultipleChoiceAnswerFormat;
//     _selectedChoices =
//         widget.result?.result ?? _multipleChoiceAnswer.defaultSelection;
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
//       resultFunction: () => InputQuestionResult(
//         id: widget.questionStep.stepIdentifier,
//         valueIdentifier:
//             _selectedChoices.map((choices) => choices.value).join(','),
//         result: _selectedChoices,
//       ),
//       child: Column(
//         children: _multipleChoiceAnswer.textChoices.map(
//           (TextChoice tc) {
//             return CheckboxListTile(
//               title: Text(tc.text),
//               value: _selectedChoices.contains(tc), // القيمة المختارة
//               onChanged: (bool? value) {
//                 setState(
//                   () {
//                     if (value ?? false) {
//                       if (_multipleChoiceAnswer.maxAnswers >
//                           _selectedChoices.length) {
//                         _selectedChoices.add(tc); // إضافة الخيار للمختارات
//                       }
//                     } else {
//                       _selectedChoices.remove(tc); // إزالة الخيار من المختارات
//                     }
//                   },
//                 );
//               },
//               controlAffinity:
//                   ListTileControlAffinity.trailing, // تحديد اتجاه العرض
//             );
//           },
//         ).toList(),
//       ),
//     );
//   }
// }
