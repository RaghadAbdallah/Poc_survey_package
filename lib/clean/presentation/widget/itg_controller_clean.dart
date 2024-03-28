import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_itg_survey/clean/presentation/widget/survey_event_clean.dart';
import 'package:poc_itg_survey/clean/presentation/widget/survey_presenter_clean.dart';

import '../../model/input_format_model/input_answer_model.dart';

class ItgSurveyControllerClean {
  final bool Function(BuildContext context, InputQuestionResult Function() resultFunction)? onNextStep;
  final bool Function(BuildContext context, InputQuestionResult Function()? resultFunction)? onStepBack;
  final bool Function(BuildContext context, InputQuestionResult Function()? resultFunction)? onCloseSurvey;

  ItgSurveyControllerClean({
    this.onNextStep,
    this.onStepBack,
    this.onCloseSurvey,
  });

  void nextStep(BuildContext context, InputQuestionResult Function() resultFunction) {
    if (onNextStep != null && !onNextStep!(context, resultFunction)) return;
    BlocProvider.of<SurveyPresenterClean>(context).add(NextStepClean(resultFunction()));
  }

  void  backStep(BuildContext context, {InputQuestionResult Function()? resultFunction}) {
    if (onStepBack != null && !onStepBack!(context, resultFunction)) return;
    BlocProvider.of<SurveyPresenterClean>(context).add(StepBackClean(resultFunction != null ? resultFunction() : null));
  }

  void closeSurvey(BuildContext context, {InputQuestionResult Function()? resultFunction}) {
    if (onCloseSurvey != null && !onCloseSurvey!(context, resultFunction)) return;
    BlocProvider.of<SurveyPresenterClean>(context).add(CloseSurveyClean(resultFunction != null ? resultFunction() : null));
  }
}