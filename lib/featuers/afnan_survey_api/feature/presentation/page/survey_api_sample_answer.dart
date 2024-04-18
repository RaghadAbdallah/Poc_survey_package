import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_itg_survey/featuers/afnan_survey_api/feature/presentation/page/question_body.dart';
import '../cubit/survey_cubit.dart';

class SurveyApiSampleAnswer extends StatefulWidget {
  const SurveyApiSampleAnswer({super.key});

  @override
  State<SurveyApiSampleAnswer> createState() => _SurveyApiSampleAnswerState();
}

class _SurveyApiSampleAnswerState extends State<SurveyApiSampleAnswer> {
  final PageController boardController = PageController();
  List<Widget> listOfQuestions = [];

  int progressValue = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(

        body: BlocBuilder<NewSurveyCubit, NewSurveyState>(
            builder: (BuildContext context, NewSurveyState state) {
          if (state is AnswerSurveyStateLoaded) {
            return Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.width*1.6,
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: boardController,
                  onPageChanged: (int index) {},
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
                          setState(() {
                            progressValue = progressValue + 1;
                          });
                        },
                        previousFunction: () async {
                          boardController.previousPage(
                              duration: const Duration(milliseconds: 750),
                              curve: Curves.fastLinearToSlowEaseIn);
                          setState(() {
                            progressValue = progressValue - 1;
                          });
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
                children: [   InkWell(
                    onTap: ()
                    async {
                      boardController.previousPage(
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                      setState(() {
                        progressValue = progressValue - 1;
                      });

                    },

                    child: const Icon(Icons.arrow_back,color: Colors.teal,)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.7,
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
                          'إغلاق',
                      style: const TextStyle(
                        color: Colors.teal,
                      ),
                    ),
                    onPressed: () {
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
