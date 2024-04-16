import 'package:flutter/material.dart';
import 'package:poc_itg_survey/featuers/afnan_survey_api/feature/presentation/page/survey_api_sample_no_answer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/survey_cubit.dart';
import 'survey_api_sample_answer.dart';

class SurveyScreen extends StatelessWidget {
  const SurveyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ITG Survey"),
          backgroundColor: Colors.teal,
          elevation: 0,
        ),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                InkWell(
                  onTap: () {
                    context.read<NewSurveyCubit>().getAnswerSurveyData();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SurveyApiSampleAnswer()));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.note_alt_rounded,
                        color: Colors.teal,
                      ),
                      Transform.translate(
                        offset: const Offset(10, 0), // التباعد بين الأيقونة والنص
                        child: const Text(
                          'Answered Survey',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                InkWell(
                  onTap: () {
                    context.read<NewSurveyCubit>().getSurveyData();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SurveyApiSample()));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.note_alt_rounded,
                        color: Colors.teal,
                      ),
                      Transform.translate(
                        offset: const Offset(10, 0), // التباعد بين الأيقونة والنص
                        child: const Text(
                          'NoAnswered Survey',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
