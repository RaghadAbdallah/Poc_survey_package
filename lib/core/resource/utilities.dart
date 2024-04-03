
import 'package:poc_itg_survey/core/resource/task_navigator/navigator_task_navigable.dart';
import 'package:poc_itg_survey/core/resource/task_navigator/navigator_task_ordered.dart';
import 'package:poc_itg_survey/core/models/order_task_clean.dart';
import 'package:poc_itg_survey/core/resource/task_navigator/task_navigator.dart';
 import '../../featuers/poc_survey_feature/data/model/navigable_task_clean.dart';
import '../../featuers/poc_survey_feature/presentation/widget/task_clean.dart';

import 'package:flutter/material.dart';

class Utilities {


  static double? screenWidth;
  static double? screenHeight;
  static void getScreenDimensions(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    screenHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
  }
  static MaterialPageRoute onGenerateRoute(
      {required RouteSettings routeSettings, required Widget nextPage}) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        getScreenDimensions(context);
        return nextPage;
      },
      settings: routeSettings,
    );
  }
  TaskNavigatorClean createTaskNavigator({required TaskClean task}) {
    switch (task.runtimeType) {
      case OrderedTaskClean:
        return OrderedTaskNavigator(task);
      case NavigableTaskClean:
        return NavigableTaskNavigator(task);
      default:
        return OrderedTaskNavigator(task);
    }
  }


  checkValidation(){

  }
}
