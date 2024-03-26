import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../featuers/presentation/bloc/survey_presenter.dart';
import '../../featuers/presentation/bloc/survey_state.dart';
import 'config_survey_progress.dart';

class SurveyProgress extends StatefulWidget {
  const SurveyProgress({Key? key}) : super(key: key);

  @override
  State<SurveyProgress> createState() => _SurveyProgressState();
}

class _SurveyProgressState extends State<SurveyProgress> {
  @override
  Widget build(BuildContext context) {
    final progressbarConfiguration = context.read<ConfigSurveyProgress>();
    return BlocBuilder<SurveyPresenter, SurveyState>(
      builder: (context, state) {
        if (state is PresentingSurveyState) {
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
