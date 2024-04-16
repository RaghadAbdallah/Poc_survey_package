import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resource/task_navigator/task_navigator.dart';
import '../../../../core/widget/config_app_bar.dart';
import '../../../custom_design/widget/build_next_previous_button.dart';
 import '../../data/model/input_answer_model.dart';
import '../../data/model/survey_result_clean.dart';
class SurveyPage extends StatefulWidget {
  final int length;
  final String titleSurvey;
  final Widget Function(ConfigAppBar appBarConfiguration)? appBar;
  final TaskNavigatorClean taskNavigator;
  const SurveyPage({
    super.key,
    required this.length,
    required this.titleSurvey,
    this.appBar,
    required this.taskNavigator
   });

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage>
    with SingleTickerProviderStateMixin {
  final PageController boardController = PageController();
  int progressValue = 0;
  Set<InputQuestionResult> results = {};


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:   Center(child: Text(widget.titleSurvey)),
      ),
      body: Wrap(
        children: [
          Column(
            children: [

              Container(
                color: Colors.white,
                height: 550,
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: boardController,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 300,
                          child: widget.taskNavigator.task.steps[index].createView(
                            questionResult:
                            results.firstWhereOrNull(
                                  (element) =>
                              element.id ==
                                  widget.taskNavigator.task.steps[index].stepIdentifier,
                            ),
                          ),
                        ),
                        NextPreviousBody(
                          isEnabled: true,
                          onPressedNext: () {
                            FocusScope.of(context).unfocus();
                            boardController.nextPage(
                                duration:
                                const Duration(milliseconds: 750),
                                curve: Curves.fastLinearToSlowEaseIn);
                            setState(() {
                              progressValue = progressValue + 1;
                            });
                          },
                          onPressedPrevious: () {
                            FocusScope.of(context).unfocus();
                            boardController.previousPage(
                                duration:
                                const Duration(milliseconds: 750),
                                curve: Curves.fastLinearToSlowEaseIn);
                            setState(() {
                              progressValue = progressValue - 1;
                            });
                          }, isFirst: index==0?true:false,isFinal: widget.taskNavigator.task.steps.length-1==index?true:false,
                        )
                      ],
                    );
                  },
                  itemCount: widget.taskNavigator.task.steps.length,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 270,
                    child: LinearProgressIndicator(
                      value:progressValue / widget.taskNavigator.task.steps.length,
                      backgroundColor: Colors.black54,
                      valueColor:
                      const AlwaysStoppedAnimation<Color>(
                          Colors.teal),
                    ),
                  ),
                  TextButton(
                    child: Text(
                      context.read<Map<String, String>?>()?['close'] ?? 'Close',
                      style: const TextStyle(
                        color: Colors.teal,
                      ),
                    ),
                    onPressed: (){
                    //  surveyController.closeSurvey(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
