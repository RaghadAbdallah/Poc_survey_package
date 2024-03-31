// import 'package:flutter/widgets.dart';
// import 'package:json_annotation/json_annotation.dart';
// import 'package:poc_itg_survey/featuers/presentation/step/step.dart';
// import 'package:poc_itg_survey/featuers/presentation/step/step_identifer.dart';
//
// import '../../data/model/question_result.dart';
// import '../../data/model/type_of_questions/bool_question_result.dart';
// import '../../data/model/type_of_questions/double_question_result.dart';
// import '../../data/model/type_of_questions/integer_question_result.dart';
// import '../../data/model/type_of_questions/multiple_choice_question_result.dart';
// import '../../data/model/type_of_questions/multiple_double_question_result.dart';
// import '../../data/model/type_of_questions/scale_question_result.dart';
// import '../../data/model/type_of_questions/single_choice_question_result.dart';
// import '../../data/model/type_of_questions/text_question_result.dart';
// import '../format_answer_view/boolean_answer_view.dart';
// import '../format_answer_view/input_format_answer_view/double_answer_view.dart';
// import '../format_answer_view/input_format_answer_view/integer_answer_view.dart';
// import '../format_answer_view/multiple_auto_complete_answer_view.dart';
// import '../format_answer_view/multiple_choice_answer_view.dart';
// import '../format_answer_view/multiple_double_answer_view.dart';
// import '../format_answer_view/scale_answer_view.dart';
// import '../format_answer_view/single_choice_answer_view.dart';
// import '../format_answer_view/input_format_answer_view/text_answer_view.dart';
// import '../type_of_answer/answer_format.dart';
// import '../type_of_answer/boolean_answer_format.dart';
// import '../type_of_answer/double_answer_format.dart';
// import '../type_of_answer/integer_answer_format.dart';
// import '../type_of_answer/multiple_choice_answer_format.dart';
// import '../type_of_answer/multiple_choice_auto_complete_answer_format.dart';
// import '../type_of_answer/multiple_double_answer_format.dart';
// import '../type_of_answer/scale_answer_format.dart';
// import '../type_of_answer/single_choice_answer_format.dart';
// import '../type_of_answer/text_answer_format.dart';
//
// @JsonSerializable()
// class QuestionStep extends Step {
//    final String title;
//   final String text;
//   final Widget content;
//   final AnswerFormat answerFormat;
//
//   QuestionStep({
//     bool isOptional = false,
//     String buttonText = 'Next',
//     StepIdentifier? stepIdentifier,
//     bool showAppBar = true,
//     this.title = '',
//     this.text = '',
//     this.content = const SizedBox.shrink(),
//     required this.answerFormat,
//   }) : super(
//     stepIdentifier: stepIdentifier,
//     isOptional: isOptional,
//     buttonText: buttonText,
//     showAppBar: showAppBar,
//   );
//
//   @override
//   Widget createView({required QuestionResult? questionResult}) {
//     final key = ObjectKey(stepIdentifier.id);
//
//     switch (answerFormat.runtimeType) {
//       case IntegerAnswerFormat:
//         return IntegerAnswerView(
//           key: key,
//           questionStep: this,
//           result: questionResult as IntegerQuestionResult?,
//         );
//       case DoubleAnswerFormat:
//         return DoubleAnswerView(
//           key: key,
//           questionStep: this,
//           result: questionResult as DoubleQuestionResult?,
//         );
//       case TextAnswerFormat:
//         return TextAnswerView(
//           key: key,
//           questionStep: this,
//           result: questionResult as TextQuestionResult?,
//         );
//       case SingleChoiceAnswerFormat:
//         FocusManager.instance.primaryFocus?.unfocus();
//         return SingleChoiceAnswerView(
//           key: key,
//           questionStep: this,
//           result: questionResult as SingleChoiceQuestionResult?,
//         );
//       case MultipleChoiceAnswerFormat:
//         return MultipleChoiceAnswerView(
//           key: key,
//           questionStep: this,
//           result: questionResult as MultipleChoiceQuestionResult?,
//         );
//       case ScaleAnswerFormat:
//         return ScaleAnswerView(
//           key: key,
//           questionStep: this,
//           result: questionResult as ScaleQuestionResult?,
//         );
//       case BooleanAnswerFormat:
//         return BoolView(
//           key: key,
//           questionStep: this,
//           result: questionResult as BooleanQuestionResult?,
//         );
//
//
//       case MultipleDoubleAnswerFormat:
//         return MultipleDoubleAnswerView(
//           key: key,
//           questionStep: this,
//           result: questionResult as MultipleDoubleQuestionResult?,
//         );
//       case MultipleChoiceAutoCompleteAnswerFormat:
//         return MultipleChoiceAutoCompleteAnswerView(
//           key: key,
//           questionStep: this,
//           result: questionResult as MultipleChoiceQuestionResult?,
//         );
//
//       default:
//         throw AnswerFormatNotDefinedException();
//     }
//   }
//
//   factory QuestionStep.fromJson(Map<String, dynamic> json) =>
//       _$QuestionStepFromJson(json);
//   Map<String, dynamic> toJson() => _$QuestionStepToJson(this);
// }
//
// QuestionStep _$QuestionStepFromJson(Map<String, dynamic> json) => QuestionStep(
//   isOptional: json['isOptional'] as bool? ?? false,
//   buttonText: json['buttonText'] as String? ?? 'Next',
//   stepIdentifier: json['stepIdentifier'] == null
//       ? null
//       : StepIdentifier.fromJson(
//       json['stepIdentifier'] as Map<String, dynamic>),
//   showAppBar: json['showAppBar'] as bool? ?? true,
//   title: json['title'] as String? ?? '',
//   text: json['text'] as String? ?? '',
//   answerFormat:
//   AnswerFormat.fromJson(json['answerFormat'] as Map<String, dynamic>),
// );
//
// Map<String, dynamic> _$QuestionStepToJson(QuestionStep instance) =>
//     <String, dynamic>{
//       'stepIdentifier': instance.stepIdentifier,
//       'isOptional': instance.isOptional,
//       'buttonText': instance.buttonText,
//       'showAppBar': instance.showAppBar,
//       'title': instance.title,
//       'text': instance.text,
//       'answerFormat': instance.answerFormat,
//     };
