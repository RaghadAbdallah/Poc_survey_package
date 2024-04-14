import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widget/config_app_bar.dart';
import '../../../../core/widget/survey_app_bar.dart';
import '../../../custom_design/widget/build_next_previous_button.dart';
import '../../data/model/input_answer_model.dart';
import '../cubit/survey_presenter_clean.dart';
import '../cubit/survey_state_clean.dart';
import '../../data/model/survey_result_clean.dart';
import '../widget/question_type/question_step_clean.dart';

class SurveyPage extends StatefulWidget {
  final int length;
  final Widget Function(ConfigAppBar appBarConfiguration)? appBar;
  final Function(SurveyResultClean) onResult;

  const SurveyPage({
    super.key,
    required this.length,
    required this.onResult,
    this.appBar,
  });

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  final PageController boardController = PageController();

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
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Center(child: Text("ITG Survey")),
            ),
            body: Wrap(
              children: [
                Column(
                  children: [
                    // SizedBox(
                    //   height: 550,
                    //   width: 400,
                    //   child: TabBarView(
                    //     physics: NeverScrollableScrollPhysics(),
                    //     controller: tabController,
                    //     children: state.steps
                    //         .map((e) => Container(
                    //             key: ValueKey<String>(
                    //               e.stepIdentifier.id,
                    //             ),
                    //             child: Wrap(
                    //               children: [
                    //                 Column(
                    //                   children: [
                    //                     SizedBox(
                    //                       height: 300,
                    //                       child: e.createView(
                    //                         questionResult: state
                    //                             .questionResults
                    //                             .firstWhereOrNull(
                    //                           (element) =>
                    //                               element.id ==
                    //                               e.stepIdentifier,
                    //                         ),
                    //                       ),
                    //                     ),
                    //                     NextPreviousBody(
                    //                         isEnabled: true,
                    //                         onPressed: () {
                    //                           // InputQuestionResult(
                    //                           //   id: widget.questionStep
                    //                           //       .stepIdentifier,
                    //                           // ),
                    //                         })
                    //                   ],
                    //                 ),
                    //               ],
                    //             )))
                    //         .toList(),
                    //   ),
                    // ),
                    SizedBox(
                      height: 550,
                      child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: boardController,
                        onPageChanged: (int index) {},
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
                                  // InputQuestionResult(
                                  //   id: widget.questionStep
                                  //       .stepIdentifier,
                                  // ),
                                },
                                onPressedPrevious: () {
                                  boardController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 750),
                                      curve: Curves.fastLinearToSlowEaseIn);
                                },
                              )
                            ],
                          );
                        },
                        itemCount: state.steps.length,
                      ),
                    ),
                    Container(
                      child: state.currentStep.showAppBar
                          ? PreferredSize(
                              preferredSize: Size(
                                double.infinity,
                                70.0,
                              ),
                              child: widget.appBar != null
                                  ? widget.appBar!
                                      .call(state.appBarConfiguration)
                                  : SurveyAppBar(
                                      appBarConfiguration:
                                          state.appBarConfiguration,
                                    ),
                            )
                          : null,
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
