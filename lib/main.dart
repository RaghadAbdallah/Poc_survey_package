import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poc_itg_survey/core/itg_survey_clean.dart';
import 'core/widget/config_survey_progress.dart';
import 'featuers/poc_survey_feature/presentation/widget/survey_result_clean.dart';
import 'featuers/poc_survey_feature/presentation/widget/task_clean.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // to read data from json file
  Future<TaskClean> loadSurveyData() async {
    String jsonString = await rootBundle.loadString('assets/survey_data.json');
    final jsonList = json.decode(jsonString);
    return TaskClean.fromJson(jsonList);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Align(
            alignment: Alignment.center,
            child: FutureBuilder<TaskClean>(
              future: loadSurveyData(),
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
                        primarySwatch: Colors.teal,
                      )
                          .copyWith(
                            onPrimary: Colors.white,
                          )
                          .copyWith(background: Colors.white),
                    ),
                    surveyProgressbarConfiguration: ConfigSurveyProgress(
                      backgroundColor: Colors.white,
                    ),
                  );
                }
                return const CircularProgressIndicator.adaptive();
              },
            )),
      ),
    );
  }
}
