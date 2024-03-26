import 'package:flutter/widgets.dart';

class ConfigAppBar {
  final Widget? leading;
  final bool? canBack;
  final bool? showProgress;
  final Widget? trailing;

  const ConfigAppBar({
    required this.canBack,
    required this.showProgress,
    this.leading,
    this.trailing,
  });
}
