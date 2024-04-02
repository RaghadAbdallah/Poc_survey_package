import 'dart:developer';

import 'package:flutter/material.dart';

import '../../data/model/new_survey_model.dart';
import '../widget/question_type/type_of_question/choice_question_answer/new_design_single_choice_api.dart';
import '../widget/question_type/type_of_question/choice_question_answer/new_multiple_design_api.dart';
import '../widget/question_type/type_of_question/input_question_answer/new_design_integer_api.dart';
import '../widget/question_type/type_of_question/input_question_answer/new_design_text_api.dart';
import '../widget/question_type/type_of_question/rating_question_answer/slider_new_design_api.dart';

class SurveyTypeWidget extends StatelessWidget {
  const SurveyTypeWidget(
      {super.key,
      required this.surveyModel,
      required this.questionIndex,
      // required this.questionID,
      required this.questionType});

  final String questionType;
  final int questionIndex;

  // final int questionID;
  final StepApi surveyModel;

  Widget surveyType(String typeSurvey, int questionID, BuildContext context) {
    Widget typeChoose = Container();
      switch (typeSurvey) {
      case  'text':
        typeChoose =NewDesignTextView();
        break;
        case  'single':
          typeChoose =NewSingleChoiceDesignApi(surveyModel: surveyModel,);
          break;
        case  'multiple':
          typeChoose =NewMultipleChoiceDesignApi(surveyModel: surveyModel,);
          break;
        case  'integer':
        case  'double':
          typeChoose =NewIntegerFormatDesign();
          break;
        case  'scale':
          typeChoose =SliderNewDesignApi(surveyModel: surveyModel,);
          break;
     }
    return typeChoose;
  }

  @override
  Widget build(BuildContext context) {
    return surveyType(questionType, 0, context);
  }
}
