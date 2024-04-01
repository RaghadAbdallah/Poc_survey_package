import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widget/config_survey_progress.dart';
import '../../../featuers/poc_survey_feature/presentation/cubit/survey_presenter_clean.dart';
import '../../../featuers/poc_survey_feature/presentation/cubit/survey_state_clean.dart';



class SurveyProgressClean extends StatelessWidget {
  const SurveyProgressClean({super.key});

  @override
  Widget build(BuildContext context) {
    final progressbarConfiguration = context.read<ConfigSurveyProgress>();
    return BlocBuilder<SurveyPresenterClean, SurveyStateClean>(
      builder: (context, state) {
        if (state is PresentingSurveyCleanState) {
          return Padding(
            padding: progressbarConfiguration.padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (progressbarConfiguration.showLabel &&
                    progressbarConfiguration.label != null)
                  progressbarConfiguration.label!(
                    state.currentStepIndex.toString(),
                    state.stepCount.toString(),
                  ),
                ClipRRect(
                  borderRadius: progressbarConfiguration.borderRadius ?? BorderRadius.circular(14.0),
                  child: Stack(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: progressbarConfiguration.height,
                          color: Colors.grey
                      ),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear,
                            width: (state.currentStepIndex + 1) / state.stepCount * constraints.maxWidth,
                            height: progressbarConfiguration.height,
                            color: Colors.teal,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
