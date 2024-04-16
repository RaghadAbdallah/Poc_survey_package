import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/resource/itg_controller_clean.dart';
import '../../../../core/widget/config_app_bar.dart';
import '../../../../core/widget/survey_app_bar.dart';
import '../../../custom_design/widget/build_next_previous_button.dart';
 import '../cubit/survey_presenter_clean.dart';
import '../cubit/survey_state_clean.dart';
import '../../data/model/survey_result_clean.dart';
class SurveyPage extends StatefulWidget {
  final int length;
  final String titleSurvey;
  final Widget Function(ConfigAppBar appBarConfiguration)? appBar;
  final Function(SurveyResultClean) onResult;
  final ItgSurveyControllerClean? controller;

  const SurveyPage({
    super.key,
    required this.length,
    required this.onResult,
    required this.titleSurvey,
    this.appBar,
    this.controller,
   });

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  final PageController boardController = PageController();
  int progressValue = 0;
  @override
  void initState() {
    tabController = TabController(length: widget.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final surveyController = widget.controller ?? context.read<ItgSurveyControllerClean>();
    return BlocConsumer<SurveyPresenterClean, SurveyStateClean>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) async {
        if (state is SurveyResultCleanState) {
          widget.onResult.call(state.result);
        }
        if (state is PresentingSurveyCleanState) {
          tabController.animateTo(state.currentStepIndex);
        }
      },
      builder: (BuildContext context, SurveyStateClean state) {
        if (state is PresentingSurveyCleanState) {
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
                        onPageChanged: (int index) {
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 300,
                                child: state.steps[index].createView(
                                  questionResult:
                                      state.questionResults.firstWhereOrNull(
                                    (element) =>
                                        element.id ==
                                        state.steps[index].stepIdentifier,
                                  ),
                                ),
                              ),
                              NextPreviousBody(
                                isEnabled: true,
                                onPressedNext: () {
                                  boardController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 750),
                                      curve: Curves.fastLinearToSlowEaseIn);
                                  setState(() {
                                    progressValue = progressValue + 1;
                                  });
                                },
                                onPressedPrevious: () {
                                  boardController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 750),
                                      curve: Curves.fastLinearToSlowEaseIn);
                                  setState(() {
                                    progressValue = progressValue - 1;
                                  });
                                }, isFirst: index==0?true:false,isFinal: state.steps.length-1==index?true:false,
                              )
                            ],
                          );
                        },
                        itemCount: state.steps.length,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 270,
                          child: LinearProgressIndicator(
                            value:progressValue / state.steps.length,
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
                           surveyController.closeSurvey(context);
                          },
                        ),
                       ],
                    ),

                  ],
                ),
              ],
            ),
          );
        } else if (state is SurveyResultCleanState &&
            state.currentStep != null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
