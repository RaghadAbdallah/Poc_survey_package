import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_itg_survey/featuers/afnan_survey_api/feature/presentation/page/question_body.dart';
import '../cubit/survey_cubit.dart';

class SurveyApiSampleAnswer extends StatefulWidget {
  @override
  State<SurveyApiSampleAnswer> createState() => _SurveyApiSampleAnswerState();
}

class _SurveyApiSampleAnswerState extends State<SurveyApiSampleAnswer> {
  final PageController boardController = PageController();

  final int indexItem = 0;

  List<Widget> listOfQuestions = [];

  int progressValue = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: BlocBuilder<NewSurveyCubit, NewSurveyState>(
            builder: (BuildContext context, NewSurveyState state) {
          if (state is AnswerSurveyStateLoaded) {
            return Column(children: [
              SizedBox(
                height: 550,
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: boardController,
                  onPageChanged: (int index) {
                    setState(() {
                      progressValue = progressValue + 1;
                    });
                  },
                  itemBuilder: (BuildContext context, int index) {
                    listOfQuestions = context
                        .read<NewSurveyCubit>()
                        .newSurveyDat!
                        .steps
                        .map((questionChoice) {
                      return QuestionBody(
                        questionIndex: index,
                        questionType: questionChoice.type == 'question'
                            ? questionChoice.answerFormat?.type ?? ''
                            : questionChoice.type,
                        nextFunction: () async {
                          boardController.nextPage(
                              duration: const Duration(milliseconds: 750),
                              curve: Curves.fastLinearToSlowEaseIn);
                        },
                        previousFunction: () async {
                          boardController.previousPage(
                              duration: const Duration(milliseconds: 750),
                              curve: Curves.fastLinearToSlowEaseIn);
                        },
                        surveyModel: questionChoice,
                        isFinal: context
                                        .read<NewSurveyCubit>()
                                        .newSurveyDat!
                                        .steps
                                        .length -
                                    1 ==
                                index
                            ? true
                            : false,
                        answerStatues: questionChoice.answerStatus ?? 0,
                      );
                    }).toList();
                    return listOfQuestions[index];
                  },
                  itemCount:
                      context.read<NewSurveyCubit>().newSurveyDat!.steps.length,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 270,
                    child: LinearProgressIndicator(
                      value: progressValue /
                          context
                              .read<NewSurveyCubit>()
                              .newSurveyDat!
                              .steps
                              .length,
                      backgroundColor: Colors.grey,
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.teal),
                    ),
                  ),
                  TextButton(
                    child: Text(
                      context.read<Map<String, String>?>()?['close'] ??
                          'Close',
                      style: const TextStyle(
                        color: Colors.teal,
                      ),
                    ),
                    onPressed: () {
                      // surveyController.closeSurvey(context);
                    },
                  ),
                ],
              )
            ]);
          }
          return Container();
        }),
      ),
    );
  }
}
