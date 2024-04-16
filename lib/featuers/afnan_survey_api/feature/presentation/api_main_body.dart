import 'package:flutter/material.dart';
import 'package:poc_itg_survey/featuers/afnan_survey_api/feature/presentation/page/survey_screen.dart';

class ApiMainBody extends StatelessWidget {
  const ApiMainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: Align(alignment: Alignment.center, child: SurveyScreen()),
        );
  }
}
