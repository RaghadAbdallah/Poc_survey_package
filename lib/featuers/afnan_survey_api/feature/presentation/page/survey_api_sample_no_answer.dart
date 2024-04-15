import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_itg_survey/featuers/afnan_survey_api/feature/presentation/page/question_body.dart';
import '../cubit/survey_cubit.dart';

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
    return BlocBuilder<NewSurveyCubit, NewSurveyState>(
        builder: (BuildContext context, NewSurveyState state) {
      if (state is NewSurveyStateLoaded) {
        return SizedBox(
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
        );
      }
      return Container();
    });
  }
}
