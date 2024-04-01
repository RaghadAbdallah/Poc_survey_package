import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/widget/config_app_bar.dart';
import '../../data/model/input_answer_model.dart';
import '../widget/steps_clean/steps_clean.dart';
import '../../data/model/survey_result_clean.dart';

part 'survey_presenter_state.dart';

class SurveyPresenterCubit extends Cubit<SurveyPresenterState> {
  SurveyPresenterCubit() : super(SurveyPresenterInitial());
}
