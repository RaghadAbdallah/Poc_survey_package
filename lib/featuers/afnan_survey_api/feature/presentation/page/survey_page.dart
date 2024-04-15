
import 'package:flutter/material.dart';
import 'package:poc_itg_survey/featuers/afnan_survey_api/feature/presentation/page/survey_api_sample_no_answer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/survey_cubit.dart';
import 'survey_api_sample_answer.dart';

class SurveyPage extends StatelessWidget {
  const SurveyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("ITG Survey"),backgroundColor: Colors.teal,elevation: 0
          ,),
        body: Center(
          child: SizedBox(
            height: 300,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                    onTap: (){
                      context.read<NewSurveyCubit>().getAnswerSurveyData();

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SurveyApiSampleAnswer()));
                    },
                    child:    const ListTile(
                      leading: Icon(Icons.note_alt_rounded,color: Colors.teal,),
                      title: Text(' Answered Survey'),
                    ), ),

                const SizedBox(height: 30,),
                InkWell(
                  onTap: (){

                    context.read<NewSurveyCubit>().getSurveyData();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SurveyApiSample()));

                  },
                    child:     const ListTile(
                      leading: Icon(Icons.note_alt_rounded,color: Colors.teal,),
                      title: Text(' NoAnswered Survey '),
                    ) ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
