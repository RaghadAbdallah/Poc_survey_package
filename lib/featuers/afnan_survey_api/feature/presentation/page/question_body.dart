import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_itg_survey/featuers/afnan_survey_api/feature/presentation/page/survey_type.dart';
import '../../../../custom_design/widget/build_next_previous_button.dart';
import '../../data/model/new_survey_model.dart';
import '../cubit/survey_cubit.dart';
class QuestionBody extends StatelessWidget {
  const QuestionBody(
      {super.key,
        required this.nextFunction,
        required this.previousFunction,
        required this.questionType,
        required this.questionIndex,
        required this.isFinal,
        required this.focusNode,
        required this.focusNodeInt,
        required this.answerStatues,
        required this.surveyModel,});

  final  StepApi  surveyModel;
  final String questionType;
  final int questionIndex;
  final bool isFinal;
  final int answerStatues;
  final FocusNode focusNode ;
  final FocusNode focusNodeInt ;
  final void Function() nextFunction;
  final void Function() previousFunction;

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(

        body: BlocBuilder<NewSurveyCubit, NewSurveyState>(
          builder: (BuildContext context, NewSurveyState state) {
            return SizedBox(
              child: Wrap(
                children: [
                  Column(
                    children: [
                      SizedBox(
                         height: MediaQuery.of(context).size.width * 0.9,
                        child: SurveyTypeWidget(
                          answerStatues:answerStatues,
                          surveyModel: surveyModel,
                          questionIndex: questionIndex,
                          questionType: questionType,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: NextPreviousBody(
                          isEnabled: true,
                          onPressedNext: () {
                            FocusScope.of(context).unfocus();
                           nextFunction();
                          },
                          onPressedPrevious: () {
                          previousFunction();
                          FocusScope.of(context).unfocus();
                          }, isFirst: questionIndex==0?true:false,
                          isFinal: isFinal,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}