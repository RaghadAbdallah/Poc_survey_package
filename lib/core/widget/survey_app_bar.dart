import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../clean/presentation/widget/itg_controller_clean.dart';
import '../../clean/presentation/widget/survey_progress_clean.dart';
import '../controller/next_back_close_controller.dart';
import 'config_app_bar.dart';
import 'survey_progress.dart';

class SurveyAppBar extends StatelessWidget {
  final ConfigAppBar appBarConfiguration;
  final ItgSurveyControllerClean? controller;

  const SurveyAppBar({super.key,
    required this.appBarConfiguration,
    this.controller,
  });

  @override
  AppBar build(BuildContext context) {
    final showProgress = appBarConfiguration.showProgress ?? context.read<bool>();
    final canGoBack = appBarConfiguration.canBack ?? true;

    final surveyController = controller ?? context.read<ItgSurveyControllerClean>();
    return AppBar(
      backgroundColor: Colors.white24,
      elevation: 0,
      leading: canGoBack
          ? appBarConfiguration.leading ??
          BackButton(
            onPressed: () {
              surveyController.backStep(context);
            },
          )
          : Container(),
      title: showProgress ? const SurveyProgressClean() : const SizedBox.shrink(),
      actions: [
        TextButton(
          child: appBarConfiguration.trailing ??
              Text(
                context.read<Map<String, String>?>()?['close'] ?? 'Close',
                style: const TextStyle(
                  color: Colors.teal,
                ),
              ),
          onPressed: () => surveyController.closeSurvey(context),
        ),
      ],
    );
  }
}
