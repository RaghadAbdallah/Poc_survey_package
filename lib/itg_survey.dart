import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:poc_itg_survey/featuers/presentation/bloc/survey_presenter.dart';
import 'package:poc_itg_survey/featuers/presentation/bloc/survey_state.dart';
import 'package:poc_itg_survey/core/widget/survey_app_bar.dart';
import 'package:provider/provider.dart';
import 'core/widget/config_app_bar.dart';
import 'core/controller/next_back_close_controller.dart';
import 'core/widget/config_survey_progress.dart';
import 'core/models/itg_survey_result.dart';
import 'core/task/navigable_task.dart';
import 'core/task/order_task.dart';
import 'core/task/task.dart';
import 'navigator/navigable_task_navigator.dart';
import 'navigator/ordered_task_navigator.dart';
import 'navigator/task_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItgSurvey extends StatefulWidget {
  final Task task;
  final ThemeData? themeData;

  // Function which is called after the results are collected
  final Function(SurveyResult) onResult;

  // [ItgSurveyController] to override the navigation methods
  // onNextStep, onBackStep, onCloseSurvey
  final ItgSurveyController? surveyController;
  final Widget Function(ConfigAppBar appBarConfiguration)? appBar;

  //If the progressbar shoud be show in the appbar
  final bool? showProgress;

  // Changes the styling of the progressbar in the appbar
  final ConfigSurveyProgress? surveyProgressbarConfiguration;

  const ItgSurvey({
    required this.task,
    required this.onResult,
    this.themeData,
    this.surveyController,
    this.appBar,
    this.showProgress,
    this.surveyProgressbarConfiguration,
  });

  @override
  _ItgSurveyState createState() => _ItgSurveyState();
}

class _ItgSurveyState extends State<ItgSurvey> {
  late TaskNavigator _taskNavigator;

  @override
  void initState() {
    super.initState();
    _taskNavigator = _createTaskNavigator();
  }

  TaskNavigator _createTaskNavigator() {
    switch (widget.task.runtimeType) {
      case OrderedTask:
        return OrderedTaskNavigator(widget.task);
      case NavigableTask:
        return NavigableTaskNavigator(widget.task);
      default:
        return OrderedTaskNavigator(widget.task);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: widget.themeData ?? Theme.of(context),
      child: MultiProvider(
        providers: [
          Provider<TaskNavigator>.value(value: _taskNavigator),
          Provider<ItgSurveyController>.value(
              value: widget.surveyController ?? ItgSurveyController()),
          Provider<bool>.value(value: widget.showProgress ?? true),
          Provider<ConfigSurveyProgress>.value(
            value:
                widget.surveyProgressbarConfiguration ?? ConfigSurveyProgress(),
          ),
        ],
        child: BlocProvider(
          create: (BuildContext context) => SurveyPresenter(
            taskNavigator: _taskNavigator,
            onResult: widget.onResult,
          ),
          child:


          SurveyPage(
            length: widget.task.steps.length,
            onResult: widget.onResult,
            appBar: widget.appBar,
          ),
        ),
      ),
    );
  }
}

class SurveyPage extends StatefulWidget {
  final int length;
  final Widget Function(ConfigAppBar appBarConfiguration)? appBar;
  final Function(SurveyResult) onResult;

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
    return BlocConsumer<SurveyPresenter, SurveyState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) async {
        if (state is SurveyResultState) {
          widget.onResult.call(state.result);
        }
        if (state is PresentingSurveyState) {
          tabController.animateTo(state.currentStepIndex);
        }
      },
      builder: (BuildContext context, SurveyState state) {
        if (state is PresentingSurveyState) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Center(child: Text("ITG Survey")),
            ),
            body: Wrap(
              children: [
                Column(
                  children: [
                    Container(
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
        } else if (state is SurveyResultState && state.currentStep != null) {
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
