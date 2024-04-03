import 'package:flutter/material.dart';
import '../../../../custom_design/custom_question_type_design/custom_integer_answer_design.dart';
import '../../../../custom_design/custom_question_type_design/custom_multiple_choice_design.dart';
import '../../../../custom_design/custom_question_type_design/custom_single_choice_design.dart';
import '../../../../custom_design/custom_question_type_design/custom_slider_poll_design.dart';
import '../../../../custom_design/custom_question_type_design/custom_text_answer_design.dart';
import '../../../../custom_design/entities/choice_item.dart';
import '../../data/model/new_survey_model.dart';
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
      case 'text':
        // typeChoose = NewDesignTextView();
        typeChoose = CustomTextAnswerDesign(
          questionDesc: surveyModel.questionDesc ?? '',
        );
        break;
      case 'single':
        //typeChoose =NewSingleChoiceDesignApi(surveyModel: surveyModel,);
        List<ChoiceItem> choiceList = [];
        final length =
            surveyModel.answerFormat?.questionsResultSurveyList?.length ?? 0;
        for (int i = 0; i < length; i++) {
          choiceList.add(ChoiceItem(
              title: surveyModel
                      .answerFormat?.questionsResultSurveyList![i].answerDesc ??
                  '',
              value: surveyModel
                  .answerFormat?.questionsResultSurveyList![i].answerId));
        }
        typeChoose = CustomSingleChoiceDesign(
          questionDesc: surveyModel.questionDesc ?? '',
          choiceList: choiceList,
        );
        break;
      case 'multiple':
        List<ChoiceItem> choiceList = [];
        final length =
            surveyModel.answerFormat?.questionsResultSurveyList?.length ?? 0;
        for (int i = 0; i < length; i++) {
          choiceList.add(ChoiceItem(
            title: surveyModel
                    .answerFormat?.questionsResultSurveyList![i].answerDesc ??
                '',
            value: surveyModel
                .answerFormat?.questionsResultSurveyList![i].answerId,
          ));
        }
        typeChoose = CustomMultipleChoiceDesign(
          questionDesc: surveyModel.questionDesc ?? '',
          choiceList: choiceList,
        );
        //     NewMultipleChoiceDesignApi(
        //   surveyModel: surveyModel,
        // );
        break;
      case 'integer':
      case 'double':
        // typeChoose = NewIntegerFormatDesign();
        typeChoose = CustomIntegerAnswerDesign(
          questionDesc: surveyModel.questionDesc ?? '',
        );
        break;
      case 'scale':
        // typeChoose = SliderNewDesignApi(
        //   surveyModel: surveyModel,
        // );
        typeChoose = CustomSliderPollDesign(
          questionDesc: surveyModel.questionDesc ?? '',
          maxValue: surveyModel.answerFormat?.maximumValue ?? 0.0,
          minValue: surveyModel.answerFormat?.minimumValue ?? 0.0,
          stepValue: surveyModel.answerFormat?.step ?? 0.0,
        );
        break;
    }
    return typeChoose;
  }

  @override
  Widget build(BuildContext context) {
    return surveyType(questionType, 0, context);
  }
}
