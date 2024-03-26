import 'package:poc_itg_survey/core/task/task.dart';
import 'package:poc_itg_survey/core/task/task_identifier.dart';
import '../../featuers/presentation/step/step.dart';
import '../../featuers/presentation/step/step_identifer.dart';
import '../models/navigation_rule.dart';

class NavigableTask extends Task {
  final Map<StepIdentifier, NavigationRule> navigationRules;

  NavigableTask({
    TaskIdentifier? id,
    List<Step> steps = const [],
    Step? initialStep,
    Map<StepIdentifier, NavigationRule>? navigationRules,
  })  : this.navigationRules = navigationRules ?? {},
        super(id: id, steps: steps, initialStep: initialStep);

  void addNavigationRule({
    required StepIdentifier forTriggerStepIdentifier,
    required NavigationRule navigationRule,
  }) {
    navigationRules.putIfAbsent(forTriggerStepIdentifier, () => navigationRule);
  }

  NavigationRule? getRuleByStepIdentifier(StepIdentifier? stepIdentifier) {
    return navigationRules[stepIdentifier];
  }

  factory NavigableTask.fromJson(Map<String, dynamic> json) {
    final Map<StepIdentifier, NavigationRule> navigationRules = {};
    if (json['rules'] != null) {
      final rules = json['rules'] as List;
      rules.forEach((rule) {
        navigationRules.putIfAbsent(
          StepIdentifier.fromJson(rule['triggerStepIdentifier']),
              () => NavigationRule.fromJson(rule as Map<String, dynamic>),
        );
      });
    }
    return NavigableTask(
      id: TaskIdentifier.fromJson(json),
      steps: json['steps'] != null
          ? (json['steps'] as List).map((step) => Step.fromJson(step as Map<String, dynamic>)).toList()
          : [],
      navigationRules: navigationRules,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id.toJson(),
    'steps': steps.map((step) => step.toJson()).toList(),
    'navigationRules': navigationRules,
  };
}
