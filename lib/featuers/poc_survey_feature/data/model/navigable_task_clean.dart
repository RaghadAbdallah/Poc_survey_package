import 'package:poc_itg_survey/featuers/poc_survey_feature/presentation/widget/steps_clean/steps_clean.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/presentation/widget/task_clean.dart';
import '../../../../core/models/navigation_rule.dart';
import '../../../../core/models/task_identifier.dart';
import 'step_identifer.dart';

class NavigableTaskClean extends TaskClean {
  final Map<StepIdentifier, NavigationRule> navigationRules;

  NavigableTaskClean({
    TaskIdentifier? id,
    List<StepClean> steps = const [],
    StepClean? initialStep,
    Map<StepIdentifier, NavigationRule>? navigationRules,
  })  :  navigationRules = navigationRules ?? {},
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

  factory NavigableTaskClean.fromJson(Map<String, dynamic> json) {
    final Map<StepIdentifier, NavigationRule> navigationRules = {};
    if (json['rules'] != null) {
      final rules = json['rules'] as List;
      for (var rule in rules) {
        navigationRules.putIfAbsent(
          StepIdentifier.fromJson(rule['triggerStepIdentifier']),
              () => NavigationRule.fromJson(rule as Map<String, dynamic>),
        );
      }
    }
    return NavigableTaskClean(
      id: TaskIdentifier.fromJson(json),
      steps: json['steps'] != null
          ? (json['steps'] as List).map((step) => StepClean.fromJson(step as Map<String, dynamic>)).toList()
          : [],
      navigationRules: navigationRules,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
    'id': id.toJson(),
    'steps': steps.map((step) => step.toJson()).toList(),
    'navigationRules': navigationRules,
  };
}