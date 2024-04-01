import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_itg_survey/core/resource/itg_survey_clean.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/data/model/navigable_task_clean.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/presentation/widget/steps_clean/steps_clean.dart';
import 'package:poc_itg_survey/featuers/poc_survey_feature/presentation/widget/task_clean.dart';
import 'core/data/data_source/remote/network_helper.dart';
import 'core/models/conditional_navigation_rule.dart';
import 'core/models/task_identifier.dart';
import 'core/widget/config_survey_progress.dart';
import 'featuers/cubit/exams_schedule_period_cubit.dart';
import 'featuers/poc_survey_feature/data/model/survey_result_clean.dart';
import 'featuers/poc_survey_feature/presentation/page/survey_api_sample.dart';
import 'injection_container/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await di.initDI();
  try {
    NetworkHelper.init();
  } catch (e) {
    log(e.toString());
  }

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<NewSurveyCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Align(
              alignment: Alignment.center,
              child:   SurveyApiSample()
                    //   ItgSurveyClean(
                    //   onResult: (SurveyResultClean result) {
                    //     Navigator.pushNamed(context, '/');
                    //   },
                    //   task:  ,
                    //   showProgress: true,
                    //   themeData: Theme.of(context).copyWith(
                    //     primaryColor: Colors.black,
                    //     textTheme: const TextTheme(
                    //       displayMedium: TextStyle(
                    //         fontSize: 28.0,
                    //         color: Colors.black,
                    //       ),
                    //       headlineSmall: TextStyle(
                    //         fontSize: 20.0,
                    //         color: Colors.black,
                    //       ),
                    //       bodyMedium: TextStyle(
                    //         fontSize: 18.0,
                    //         color: Colors.black,
                    //       ),
                    //       titleMedium: TextStyle(
                    //         fontSize: 18.0,
                    //         color: Colors.black,
                    //       ),
                    //     ),
                    //     inputDecorationTheme: const InputDecorationTheme(
                    //       labelStyle: TextStyle(
                    //         color: Colors.black,
                    //       ),
                    //     ),
                    //     colorScheme: ColorScheme.fromSwatch(
                    //       primarySwatch: Colors.teal,
                    //     )
                    //         .copyWith(
                    //       onPrimary: Colors.white,
                    //     )
                    //         .copyWith(background: Colors.white),
                    //   ),
                    //   surveyProgressbarConfiguration: ConfigSurveyProgress(
                    //     backgroundColor: Colors.white,
                    //   ),
                    // );


              ),
          ),

      ),
    );
  }

}
