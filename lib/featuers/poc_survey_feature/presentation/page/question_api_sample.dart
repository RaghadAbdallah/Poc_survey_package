import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_itg_survey/featuers/cubit/exams_schedule_period_cubit.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/data/model/new_survey_model.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/presentation/page/survey_type_widget.dart';

import 'on_tap_widget.dart';

class QuestionBody extends StatelessWidget {
  QuestionBody(
      {super.key,
        required this.nextFunction,
        required this.previousFunction,
        required this.questionType,
        required this.questionIndex,
        required this.questionTxt,
        //required this.mandatoryQt,
        required this.surveyModel,
        required this.indexItem, });

  final int indexItem;
  final  StepApi  surveyModel;
  final String questionTxt;
  final String questionType;
  final int questionIndex;
  //final int mandatoryQt;

  final void Function() nextFunction;
  final void Function() previousFunction;

  String evaluationString = '';
  String textString = '';
  String questionIDString = '';

  // bool mandatoryQuestion(int typeQt, BuildContext context) {
  //   bool isAnswered = false;
  //   switch (typeQt) {
  //     case 1:
  //       if (context.read<NewSurveyCubit>().checkData.isEmpty) {
  //         isAnswered = false;
  //       } else {
  //         isAnswered = true;
  //       }
  //       break;
  //     case 2:
  //       if (Utilities.oneOptionValue(
  //           context.read<GetSurveyCubit>().oneOption,
  //           context
  //               .read<GetUserSurveyCubit>()
  //               .userSurvey[questionIndex]
  //               .questionId)! <
  //           0) {
  //         isAnswered = false;
  //       } else {
  //         isAnswered = true;
  //       }
  //       break;
  //     case 4:
  //       if (answerController.text == '' || answerController.text.isEmpty) {
  //         isAnswered = false;
  //       } else {
  //         isAnswered = true;
  //       }
  //       break;
  //     case 3:
  //       if (Utilities.getSliderValue(
  //           context.read<GetSurveyCubit>().target,
  //           context
  //               .read<GetUserSurveyCubit>()
  //               .userSurvey[questionIndex]
  //               .questionId) <
  //           1) {
  //         isAnswered = false;
  //       } else {
  //         isAnswered = true;
  //       }
  //       break;
  //   }
  //   return isAnswered;
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        backgroundColor:Colors.white,
        body: BlocBuilder<NewSurveyCubit, NewSurveyState>(
          builder: (BuildContext context, NewSurveyState state) {
            return SizedBox(
              height: 320,
              child: Center(
                child: Wrap(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all( 8),
                          child:Text(questionTxt)
                        ),
                        Padding(
                          padding:   EdgeInsets.only(top: 8),
                          child: SurveyTypeWidget(
                            surveyModel: surveyModel,
                            questionIndex: questionIndex,
                            // questionID: questionID,
                              questionType: questionType,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // if (context.read<GetUserSurveyCubit>().userSurvey.length -
                            //     1 ==
                            //     questionIndex)
                            //   OnTapWidget(
                            //     onTapFunction: () async {
                            //       if (context.read<NewSurveyCubit>().newSurveyDat.first.steps[questionIndex].answerStatus == 1) {
                            //         // await context
                            //         //     .read<GetSurveyCubit>()
                            //         //     .getSurveyInformation(
                            //         //     userTypeID: infoModel?.userTypeId ?? '',
                            //         //     userProfileID:
                            //         //     infoModel?.userProfileId ?? '');
                            //         /// cubit method
                            //         Navigator.push(
                            //             context,
                            //             MaterialPageRoute(
                            //                 builder: (context) => SurveyScreen(
                            //                   infoModel: infoModel,
                            //                   identificationID: identificationID ?? '',
                            //                   indexItem: indexItem,
                            //                 )));
                            //       } else if (mandatoryQuestion(questionType, context) ==
                            //           false) {
                            //         return Utilities.showToastMessage(
                            //             questionType == 1 || questionType == 2
                            //                 ? 'الرجاء اختيار اجابة واحدة على الأقل'
                            //                 : 'الرجاء ادخال الاجابة',
                            //             context);
                            //       } else {
                            //         if (context
                            //             .read<GetSurveyCubit>()
                            //             .pageToValueChanged[questionIndex] !=
                            //             true) {
                            //           context
                            //               .read<GetSurveyCubit>()
                            //               .changeProgressValue =
                            //               context.read<GetSurveyCubit>().progressValue +
                            //                   1;
                            //
                            //           context
                            //               .read<GetSurveyCubit>()
                            //               .pageToValueChanged[questionIndex] = true;
                            //         }
                            //         showDialog(
                            //             barrierDismissible: false,
                            //             context: context,
                            //             builder: (BuildContext context) =>
                            //                 ShowSubmitDialog(
                            //                   surveyModel: surveyModel,
                            //                   infoModel: infoModel,
                            //                   identificationID: identificationID ?? '',
                            //                   indexItem: indexItem,
                            //                 ));
                            //       }
                            //     },
                            //     buttonTitle: surveyModel.steps[questionIndex].answerStatus == 1
                            //         ? 'surveyBack'
                            //         : 'surveySave',
                            //     surveyModel: surveyModel,
                            //   )
                            // else

                              OnTapWidget(
                                onTapFunction: () async {
                                  // if (mandatoryQuestion(questionType, context) ==
                                  //     false &&
                                  //     mandatoryQt == 1 &&
                                  //     surveyModel.steps[questionIndex].answerStatus == 0) {
                                  //   return Utilities.showToastMessage(
                                  //       questionType == 1 || questionType == 2
                                  //           ? 'الرجاء إختيار إجابة واحدة على الأقل'
                                  //           : 'الرجاء إدخال الإجابة',
                                  //       context);
                                  // } else {
                                  //   FocusScope.of(context).unfocus();
                                  //   // if (context
                                  //   //         .read<GetSurveyCubit>()
                                  //   //         .pageToValueChanged[questionIndex] !=
                                  //   //     true) {
                                  //   context.read<GetSurveyCubit>().changeProgressValue =
                                  //       context.read<GetSurveyCubit>().progressValue +
                                  //           1;
                                  //
                                  //   // context
                                  //   //     .read<GetSurveyCubit>()
                                  //   //     .pageToValueChanged[questionIndex] = true;
                                  //   //   }
                                      nextFunction();
                                  // }
                                },
                                buttonTitle: 'next',
                              )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}