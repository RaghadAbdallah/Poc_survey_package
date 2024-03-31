import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/widget/config_app_bar.dart';
import '../../model/input_format_model/input_answer_model.dart';
import '../widget/steps_clean/steps_clean.dart';
import '../widget/survey_result_clean.dart';

part 'survey_presenter_state.dart';

class SurveyPresenterCubit extends Cubit<SurveyPresenterState> {
  SurveyPresenterCubit() : super(SurveyPresenterInitial());
}
