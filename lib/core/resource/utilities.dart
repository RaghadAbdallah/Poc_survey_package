
import 'package:poc_itg_survey/core/resource/task_navigator/navigator_task_navigable.dart';
import 'package:poc_itg_survey/core/resource/task_navigator/navigator_task_ordered.dart';
import 'package:poc_itg_survey/core/resource/task_navigator/order_task_clean.dart';
import 'package:poc_itg_survey/core/resource/task_navigator/task_navigator.dart';
 import '../../featuers/poc_survey_feature/presentation/widget/navigable_task_clean.dart';
import '../../featuers/poc_survey_feature/presentation/widget/task_clean.dart';



class Utilities {
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
