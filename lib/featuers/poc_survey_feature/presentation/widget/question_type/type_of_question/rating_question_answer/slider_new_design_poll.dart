// import 'package:flutter/material.dart';
// import '../../../../../data/model/input_answer_model.dart';
// import '../../../../../data/model/type_of_answer/scale_answer_format.dart';
// import '../../question_step_clean.dart';
//
// class SliderNewDesign extends StatefulWidget {
//   const SliderNewDesign({
//     super.key,
//     required this.questionStep,
//     required this.result,
//   });
//
//   final QuestionStepClean questionStep;
//   final InputQuestionResult? result;
//
//   @override
//   State<SliderNewDesign> createState() => _SliderNewDesignState();
// }
//
// class _SliderNewDesignState extends State<SliderNewDesign> {
//   late final ScaleAnswerFormat _scaleAnswerFormat;
//   late double _sliderValue;
//
//   @override
//   void initState() {
//     super.initState();
//     _scaleAnswerFormat = widget.questionStep.answerFormat as ScaleAnswerFormat;
//     _sliderValue = widget.result?.result ?? _scaleAnswerFormat.defaultValue;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             width: double.infinity,
//             height: 35,
//             decoration: BoxDecoration(
//               borderRadius: const BorderRadius.all(Radius.circular(25.0)),
//               gradient: LinearGradient(
//                 colors: [
//                   Colors.teal[200] ?? Colors.teal,
//                   Colors.teal[400] ?? Colors.teal,
//                 ],
//                 begin: FractionalOffset.topLeft,
//                 end: FractionalOffset.bottomRight,
//                 stops: const [0.0, 1.0],
//               ),
//             ),
//             child: SliderTheme(
//               data: SliderTheme.of(context).copyWith(
//                 activeTickMarkColor: Colors.orange,
//                 thumbShape: CustomThumbShape(
//                   thumbRadius: 15,
//                   thumbColor: Colors.white, // لون الدائرة
//                   textColor: Colors.black, // لون النص
//                   textStyle: const TextStyle(color: Colors.black),
//                   borderColor: Colors.orange, // لون الحدود البرتقالي
//                   borderWidth: 1.5, // عرض الحدود// نمط النص),
//                 ),
//               ),
//               child: Slider.adaptive(
//                 value: _sliderValue,
//                 onChanged: (double value) {
//                   setState(() {
//                     _sliderValue = value;
//                   });
//                 },
//                 min: _scaleAnswerFormat.minimumValue,
//                 max: _scaleAnswerFormat.maximumValue,
//                 activeColor: Colors.white,
//                 divisions: (_scaleAnswerFormat.maximumValue -
//                         _scaleAnswerFormat.minimumValue) ~/
//                     _scaleAnswerFormat.step,
//                 label: _sliderValue.toString(),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top:8.0),
//             child: Text(
//               'value: $_sliderValue',
//               textAlign: TextAlign.center,
//               style: TextStyle(color: Colors.grey[600]),
//             ),
//           ),
//           Row(
//             children: [
//               Text(
//                 ' ${_scaleAnswerFormat.minimumValue}',
//                 style: TextStyle(color: Colors.grey[600]),
//               ),
//               Spacer(),
//               Text(
//                 ' ${_scaleAnswerFormat.maximumValue}',
//                 style: TextStyle(color: Colors.grey[600]),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
//
