import 'conditional_navigation_rule.dart';
import 'direct_navigation_rule.dart';
import '../exception/error_exception.dart';

abstract class NavigationRule {
  const NavigationRule();

  factory NavigationRule.fromJson(Map<String, dynamic> json) {
    final type = json['type'];
    if (type == 'conditional') {
      return ConditionalNavigationRule.fromJson(json);
    } else if (type == 'direct') {
      return DirectNavigationRule.fromJson(json);
    }
    throw const Exceptions();
  }
  Map<String, dynamic> toJson();
}
// class RuleNotDefinedException implements Exception {
//   const RuleNotDefinedException() : super();
// }
