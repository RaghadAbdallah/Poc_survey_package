import 'package:flutter/material.dart';

import '../../data/model/new_survey_model.dart';

class SurveyTypeWidget extends StatelessWidget {
  const SurveyTypeWidget(
      {super.key,
      required this.surveyModel,
      required this.questionIndex,
     // required this.questionID,
    //  required this.questionType
      });

 // final int questionType;
  final int questionIndex;
 // final int questionID;
  final  NewSurveyModel  surveyModel;

  Widget surveyType(int typeSurvey, int questionID, BuildContext context) {
    Widget typeChoose = Container();
    // switch (typeSurvey) {
    //   case 1:
    //     typeChoose = MultipleChoice(
    //       questionIndex: questionIndex,
    //       questionID: questionID,
    //       surveyModel: surveyModel,
    //     );
    //     break;
    //   case 2:
    //     typeChoose = OneChoice(
    //       questionIndex: questionIndex,
    //       questionID: questionID,
    //       surveyModel: surveyModel,
    //     );
    //     break;
    //   case 4:
    //     answerController.text = '';
    //     if (context
    //             .read<GetUserSurveyCubit>()
    //             .userSurvey[questionIndex]
    //             .answerStatus ==
    //         2) {
    //       print(questionID);
    //       for (int i = 0;
    //           i < context.read<GetSurveyCubit>().evaluationTextAnswer.length;
    //           i++) {
    //         if (context
    //                 .read<GetSurveyCubit>()
    //                 .evaluationTextAnswer[i]
    //                 .keys
    //                 .last ==
    //             questionID.toString()) {
    //           answerController.text = context
    //               .read<GetSurveyCubit>()
    //               .evaluationTextAnswer[i][questionID.toString()];
    //           break;
    //         }
    //       }
    //     } else {
    //       answerController.text = context
    //               .read<GetUserSurveyCubit>()
    //               .userSurvey[questionIndex]
    //               .questionsResultSurveyList[0]
    //               .answerDate ??
    //           '';
    //     }
    //     typeChoose = TextChoice(
    //       questionID: questionID,
    //       questionIndex: questionIndex,
    //       surveyModel: surveyModel,
    //     );
    //     break;
    //   case 3:
    //     typeChoose = EvaluationChoice(
    //       questionID: questionID,
    //       questionIndex: questionIndex,
    //       surveyModel: surveyModel,
    //     );
    //     break;
    // }
    return typeChoose;
  }

  @override
  Widget build(BuildContext context) {
    return surveyType(0, 0, context);
  }
}
