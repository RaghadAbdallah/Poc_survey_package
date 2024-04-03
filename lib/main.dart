import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'featuers/afnan_survey_api/core/data/data_source/remote/network_helper.dart';
import 'featuers/afnan_survey_api/feature/presentation/cubit/survey_cubit.dart';
import 'featuers/afnan_survey_api/feature/presentation/page/survey_screen.dart';
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
          body: Align(alignment: Alignment.center, child: SurveyApiSample()),
        ),
      ),
    );
  }
}

