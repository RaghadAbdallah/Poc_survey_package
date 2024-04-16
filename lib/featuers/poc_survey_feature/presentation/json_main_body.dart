import 'package:flutter/material.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/presentation/widget/task_clean.dart';

import '../../../core/resource/itg_survey_clean.dart';
import '../../../core/resource/utilities.dart';
import '../../../core/widget/config_survey_progress.dart';
import '../data/model/survey_result_clean.dart';

class JsonMainBody extends StatelessWidget {
  const JsonMainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
          alignment: Alignment.center,
          child: FutureBuilder<TaskClean>(
            future: Utilities().loadSurveyData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData &&
                  snapshot.data != null) {
                final task = snapshot.data!;
                return ItgSurveyClean(
                  onResult: (SurveyResultClean result) {
                    Navigator.pushNamed(context, '/');
                  },
                  task: task,
                  showProgress: true,
                  themeData: Theme.of(context).copyWith(
                    primaryColor: Colors.black,
                    textTheme: const TextTheme(
                      displayMedium: TextStyle(
                        fontSize: 28.0,
                        color: Colors.black,
                      ),
                      headlineSmall: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                      bodyMedium: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      titleMedium: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                    inputDecorationTheme: const InputDecorationTheme(
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    colorScheme: ColorScheme.fromSwatch(
                      primarySwatch:  Colors.teal,
                    )
                        .copyWith(
                      onPrimary: Colors.white,
                    )
                        .copyWith(background: Colors.white),
                  ),
                  surveyProgressbarConfiguration: ConfigSurveyProgress(
                    backgroundColor: Colors.white,
                    progressbarColor:Colors.black,
                    valueProgressbarColor:Colors.yellow,
                  ),
                );
              }
              return const CircularProgressIndicator.adaptive();
            },
          )),
    );
  }
}