import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_itg_survey/clean/presentation/cubit/survey_presenter_clean.dart';
import 'package:poc_itg_survey/clean/presentation/cubit/survey_state_clean.dart';

import '../../clean/presentation/widget/survey_result_clean.dart';
import '../../core/widget/config_app_bar.dart';
import '../../core/widget/survey_app_bar.dart';
class SurveyPage extends StatefulWidget {
  final int length;
  final Widget Function(ConfigAppBar appBarConfiguration)? appBar;
  final Function(SurveyResultClean) onResult;

  const SurveyPage({
    required this.length,
    required this.onResult,
    this.appBar,
  });

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: widget.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurveyPresenterClean, SurveyStateClean>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) async {
        if (state is SurveyResultCleanState) {
          widget.onResult.call(state.result);
        }
        if (state is PresentingSurveyCleanState) {
          tabController.animateTo(state.currentStepIndex);
        }
      },
      builder: (BuildContext context, SurveyStateClean state) {
        if (state is PresentingSurveyCleanState) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Center(child: Text("ITG Survey")),
            ),
            body: Wrap(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 550,
                      width: 400,
                      child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: tabController,
                        children: state.steps
                            .map((e) => Container(
                          key: ValueKey<String>(
                            e.stepIdentifier.id,
                          ),
                          child: e.createView(
                            questionResult:
                            state.questionResults.firstWhereOrNull(
                                  (element) =>
                              element.id == e.stepIdentifier,
                            ),
                          ),
                        ))
                            .toList(),
                      ),
                    ),
                    Container(
                      child: state.currentStep.showAppBar
                          ? PreferredSize(
                        preferredSize: Size(
                          double.infinity,
                          70.0,
                        ),
                        child: widget.appBar != null
                            ? widget.appBar!
                            .call(state.appBarConfiguration)
                            : SurveyAppBar(
                          appBarConfiguration:
                          state.appBarConfiguration,
                        ),
                      )
                          : null,
                    ),
                  ],
                ),
              ],
            ),
          );
        } else if (state is SurveyResultCleanState && state.currentStep != null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}