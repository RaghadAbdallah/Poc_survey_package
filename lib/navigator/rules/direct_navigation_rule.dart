import 'package:json_annotation/json_annotation.dart';
import '../../core/models/navigation_rule.dart';
import '../../featuers/presentation/step/step_identifer.dart';

@JsonSerializable()
class DirectNavigationRule implements NavigationRule {
  final StepIdentifier destinationStepIdentifier;

  DirectNavigationRule(this.destinationStepIdentifier);

  factory DirectNavigationRule.fromJson(Map<String, dynamic> json) =>
      _$DirectNavigationRuleFromJson(json);
  Map<String, dynamic> toJson() => _$DirectNavigationRuleToJson(this);
}

DirectNavigationRule _$DirectNavigationRuleFromJson(
    Map<String, dynamic> json) =>
    DirectNavigationRule(
      StepIdentifier.fromJson(
          json['destinationStepIdentifier'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DirectNavigationRuleToJson(
    DirectNavigationRule instance) =>
    <String, dynamic>{
      'destinationStepIdentifier': instance.destinationStepIdentifier,
    };
