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
      required this.questionType});

  final String questionType;
  final int questionIndex;
  final StepApi surveyModel;

  Widget surveyType(String typeSurvey, int questionID, BuildContext context) {
    Widget typeChoose = Padding(
      padding: const EdgeInsets.only(top: 200.0),
      child: Text(
        surveyModel.questionDesc ?? '',
        style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 18,color: Colors.lightBlue),
        textAlign: TextAlign.center,

      ),
    );
    switch (typeSurvey) {
      case 'text':
        typeChoose = CustomTextAnswerDesign(
          questionDesc: surveyModel.questionDesc ?? '',
        );
        break;
      case 'single':
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
        break;
      case 'integer':
        typeChoose = CustomIntegerAnswerDesign(
          questionDesc: surveyModel.questionDesc ?? '',
        );
        break;
      case "intro":
        typeChoose = CustomIntegerAnswerDesign(
          questionDesc: surveyModel.questionDesc ?? 'ddddddddddddddddddd',
        );
        break;
      case 'double':
        typeChoose = CustomIntegerAnswerDesign(
          questionDesc: surveyModel.questionDesc ?? '',
        );
        break;
      case 'scale':
        typeChoose = CustomSliderPollDesign(
          questionDesc: surveyModel.questionDesc ?? '',
          maxValue: surveyModel.answerFormat?.maximumValue ?? 0.0,
          minValue: surveyModel.answerFormat?.minimumValue ?? 0.0,
          stepValue: surveyModel.answerFormat?.step ?? 0.0,
        );
        break;
    }
    return     typeChoose;
  }

  @override
  Widget build(BuildContext context) {
    return surveyType(questionType, 0, context);
  }
}
