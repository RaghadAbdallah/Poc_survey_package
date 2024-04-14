import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_itg_survey/featuers/afnan_survey_api/feature/presentation/page/survey_type.dart';
import '../../../../custom_design/widget/build_next_previous_button.dart';
import '../../data/model/new_survey_model.dart';
import '../cubit/survey_cubit.dart';
import '../on_tap_widget.dart';

class QuestionBody extends StatelessWidget {
  QuestionBody(
      {super.key,
        required this.nextFunction,
        required this.previousFunction,
        required this.questionType,
        required this.questionIndex,
        required this.isFinal,
        required this.surveyModel,});

  final  StepApi  surveyModel;
  final String questionType;
  final int questionIndex;
  final bool isFinal;

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
        backgroundColor:Colors.white,
        body: BlocBuilder<NewSurveyCubit, NewSurveyState>(
          builder: (BuildContext context, NewSurveyState state) {
            return SizedBox(
              height: 500,
              child: Center(
                child: Wrap(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:   const EdgeInsets.only(top: 8),
                          child: SizedBox(
                             height: 400,
                            child: SurveyTypeWidget(
                              surveyModel: surveyModel,
                              questionIndex: questionIndex,
                              questionType: questionType,
                            ),
                          ),
                        ),
                        NextPreviousBody(
                          isEnabled: true,
                          onPressedNext: () {
                           nextFunction();
                          },
                          onPressedPrevious: () {
                          previousFunction();
                          }, isFirst: questionIndex==0?true:false,
                          isFinal: isFinal,
                        )
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     OnTapWidget(
                        //       onTapFunction: () async {
                        //         nextFunction();
                        //       },
                        //       buttonTitle: 'next',
                        //     )
                        //   ],
                        // ),
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