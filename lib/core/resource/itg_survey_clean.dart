import 'package:flutter/material.dart';
import 'package:poc_itg_survey/core/resource/task_navigator/task_navigator.dart';
 import 'package:poc_itg_survey/core/widget/config_app_bar.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/presentation/page/survey_page.dart';
import 'package:provider/provider.dart';
import 'utilities.dart';
import '../../featuers/poc_survey_feature/data/model/survey_result_clean.dart';
import '../../featuers/poc_survey_feature/presentation/widget/task_clean.dart';

class ItgSurveyClean extends StatefulWidget {
  final TaskClean task;
  final ThemeData? themeData;
  final Function(SurveyResultClean) onResult;
  final Widget Function(ConfigAppBar appBarConfiguration)? appBar;

  const ItgSurveyClean({
    super.key,
    required this.task,
    required this.onResult,
    this.themeData,
    this.appBar,
  });

  @override
  State<ItgSurveyClean> createState() => _ItgSurveyCleanState();
}

class _ItgSurveyCleanState extends State<ItgSurveyClean> {
  late TaskNavigatorClean _taskNavigator;

  @override
  void initState() {
    super.initState();
    _taskNavigator = Utilities().createTaskNavigator(task: widget.task);
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
          Provider<TaskNavigatorClean>.value(value: _taskNavigator),
        ],
        child: SurveyPage(
          titleSurvey:"ITG Survey",
          length: widget.task.steps.length,
          appBar: widget.appBar,
          taskNavigator: _taskNavigator,
        ),
      ),
    );
  }
}
