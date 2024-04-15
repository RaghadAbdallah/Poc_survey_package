import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'featuers/afnan_survey_api/core/data/data_source/remote/network_helper.dart';
import 'featuers/afnan_survey_api/feature/presentation/cubit/survey_cubit.dart';
import 'featuers/afnan_survey_api/feature/presentation/page/survey_page.dart';
import 'package:poc_itg_survey/featuers/afnan_survey_api/injection_container/injection_container.dart'
    as di;

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
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,

        home: Scaffold(
          body: Align(alignment: Alignment.center, child: SurveyPage()),
        ),
      ),
    );
  }
}

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:poc_itg_survey/core/resource/itg_survey_clean.dart';
// import 'core/widget/config_survey_progress.dart';
// import 'featuers/poc_survey_feature/data/model/survey_result_clean.dart';
// import 'featuers/poc_survey_feature/presentation/widget/task_clean.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   // to read data from json file
//   Future<TaskClean> loadSurveyData() async {
//     String jsonString = await rootBundle.loadString('assets/survey_data.json');
//     final jsonList = json.decode(jsonString);
//     return TaskClean.fromJson(jsonList);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Align(
//             alignment: Alignment.center,
//             child: FutureBuilder<TaskClean>(
//               future: loadSurveyData(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done &&
//                     snapshot.hasData &&
//                     snapshot.data != null) {
//                   final task = snapshot.data!;
//                   return ItgSurveyClean(
//                     onResult: (SurveyResultClean result) {
//                       Navigator.pushNamed(context, '/');
//                     },
//                     task: task,
//                     showProgress: true,
//                     themeData: Theme.of(context).copyWith(
//                       primaryColor: Colors.black,
//                       textTheme: const TextTheme(
//                         displayMedium: TextStyle(
//                           fontSize: 28.0,
//                           color: Colors.black,
//                         ),
//                         headlineSmall: TextStyle(
//                           fontSize: 20.0,
//                           color: Colors.black,
//                         ),
//                         bodyMedium: TextStyle(
//                           fontSize: 18.0,
//                           color: Colors.black,
//                         ),
//                         titleMedium: TextStyle(
//                           fontSize: 18.0,
//                           color: Colors.black,
//                         ),
//                       ),
//                       inputDecorationTheme: const InputDecorationTheme(
//                         labelStyle: TextStyle(
//                           color: Colors.black,
//                         ),
//                       ),
//                       colorScheme: ColorScheme.fromSwatch(
//                         primarySwatch:  Colors.teal,
//                       )
//                           .copyWith(
//                         onPrimary: Colors.white,
//                       )
//                           .copyWith(background: Colors.white),
//                     ),
//                     surveyProgressbarConfiguration: ConfigSurveyProgress(
//                       backgroundColor: Colors.white,
//                         progressbarColor:Colors.black,
//                         valueProgressbarColor:Colors.yellow,
//                     ),
//                   );
//                 }
//                 return const CircularProgressIndicator.adaptive();
//               },
//             )),
//       ),
//     );
//   }
// }
//
