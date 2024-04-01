import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_itg_survey/featuers/cubit/exams_schedule_period_cubit.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/presentation/page/question_api_sample.dart';

class SurveyApiSample extends StatefulWidget {
  const SurveyApiSample({Key? key}) : super(key: key);

  @override
  State<SurveyApiSample> createState() => _SurveyApiSampleState();
}

class _SurveyApiSampleState extends State<SurveyApiSample> {
  final PageController boardController = PageController();
  final int indexItem = 0;
  List<Widget> listOfQuestions = [];

  @override
  void initState() {
    context.read<NewSurveyCubit>().geSurveyData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewSurveyCubit,
        NewSurveyState>(
        builder:
            (BuildContext context, NewSurveyState state) {
          if (state is NewSurveyStateLoaded) {
            return Container(
              color: Colors.red,
              height: 500,
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {},
                itemBuilder: (BuildContext context, int index) {
                  listOfQuestions = context
                      .read<NewSurveyCubit>()
                      .newSurveyDat!
                      .steps
                      .map(( questionChoice) {
                    return QuestionBody(
                      questionTxt:questionChoice.questionDesc==""?questionChoice.title??"":questionChoice.questionDesc??"",
                      questionIndex: index,
                      questionType: questionChoice.type,
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

                      surveyModel: context
                          .read<NewSurveyCubit>()
                          .newSurveyDat!,
                      // mandatoryQt: questionChoice.mandatoryQuestion,
                      indexItem: indexItem,
                    );
                  }).toList();
                  return listOfQuestions[index];
                },
                itemCount: context
                    .read<NewSurveyCubit>()
                    .newSurveyDat!
                    .steps
                    .length,
              ),
            );
          }
          return Container(
            color: Colors.cyan,
            height: 500,
          );
        });
  }
}