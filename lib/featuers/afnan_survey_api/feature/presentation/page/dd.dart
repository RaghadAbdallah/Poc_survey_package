
import 'package:flutter/material.dart';
import 'package:poc_itg_survey/featuers/afnan_survey_api/feature/presentation/page/survey_screen.dart';

import 'ddd.dart';

class ddd extends StatelessWidget {
  const ddd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: Column(
            children: [
              InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SurveyApiSample2()));
                  },
                  child: Text("Answer")),

              SizedBox(height: 30,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SurveyApiSample()));

                },
                  child: Text("NoAnswer")),
            ],
          ),
        ),
      ),
    );
  }
}
