import 'package:poc_itg_survey/clean/presentation/widget/task_clean.dart';
import 'package:poc_itg_survey/clean/task_navigator/navigator_task_navigable.dart';
import 'package:poc_itg_survey/clean/task_navigator/navigator_task_ordered.dart';
import 'package:poc_itg_survey/clean/task_navigator/task_navigator.dart';
import '../../core/task/order_task.dart';
import '../presentation/widget/navigable_task_clean.dart';
import '../task_navigator/order_task_clean.dart';


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
