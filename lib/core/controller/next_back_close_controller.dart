import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../featuers/presentation/bloc/survey_presenter.dart';
import '../../featuers/presentation/bloc/survey_event.dart';
import '../../featuers/data/model/question_result.dart';

class ItgSurveyController {
  final bool Function(BuildContext context, QuestionResult Function() resultFunction)? onNextStep;
  final bool Function(BuildContext context, QuestionResult Function()? resultFunction)? onStepBack;
  final bool Function(BuildContext context, QuestionResult Function()? resultFunction)? onCloseSurvey;

  ItgSurveyController({
    this.onNextStep,
    this.onStepBack,
    this.onCloseSurvey,
  });

  void nextStep(BuildContext context, QuestionResult Function() resultFunction) {
    if (onNextStep != null && !onNextStep!(context, resultFunction)) return;
    BlocProvider.of<SurveyPresenter>(context).add(NextStep(resultFunction()));
  }

  void  backStep(BuildContext context, {QuestionResult Function()? resultFunction}) {
    if (onStepBack != null && !onStepBack!(context, resultFunction)) return;
    BlocProvider.of<SurveyPresenter>(context).add(StepBack(resultFunction != null ? resultFunction() : null));
  }

  void closeSurvey(BuildContext context, {QuestionResult Function()? resultFunction}) {
    if (onCloseSurvey != null && !onCloseSurvey!(context, resultFunction)) return;
    BlocProvider.of<SurveyPresenter>(context).add(CloseSurvey(resultFunction != null ? resultFunction() : null));
  }
}
