import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:poc_itg_survey/clean/model/input_format_model/input_answer_model.dart';
import 'package:poc_itg_survey/clean/presentation/widget/steps_clean_type/question_type/question_step_clean.dart';
import 'package:poc_itg_survey/clean/presentation/widget/steps_clean/steps_view_clean.dart';

import '../../../../../../../core/widget/selection_list_tile.dart';
import '../../../../../../../featuers/presentation/type_of_answer/multiple_choice_answer_format.dart';
import '../../../../../../../featuers/presentation/type_of_answer/text_choice.dart';

class MultipleChoiceAnswerViewClean extends StatefulWidget {
  const MultipleChoiceAnswerViewClean({
    super.key,
    required this.questionStep,
    required this.result,
  });

  final QuestionStepClean questionStep;
  final InputQuestionResult? result;

  @override
  State<MultipleChoiceAnswerViewClean> createState() =>
      _MultipleChoiceAnswerViewCleanState();
}

class _MultipleChoiceAnswerViewCleanState
    extends State<MultipleChoiceAnswerViewClean> {
  late final MultipleChoiceAnswerFormat _multipleChoiceAnswer;

  List<TextChoice> _selectedChoices = [];
  @override
  void initState() {
    super.initState();
    _multipleChoiceAnswer =
    widget.questionStep.answerFormat as MultipleChoiceAnswerFormat;
    _selectedChoices =
        widget.result?.result ?? _multipleChoiceAnswer.defaultSelection;
  }
  @override
  Widget build(BuildContext context) {
    return StepViewClean(
      step: widget.questionStep,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Text(
                widget.questionStep.text,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            Column(
              children: [
                Divider(
                  color: Colors.grey,
                ),
                ..._multipleChoiceAnswer.textChoices
                    .map(
                      (TextChoice tc) => ListTileWidget(
                    text: tc.text,
                    onTap: () {
                      setState(
                            () {
                          if (_selectedChoices.contains(tc)) {
                            _selectedChoices.remove(tc);
                          } else {
                            if(_multipleChoiceAnswer.maxAnswers > _selectedChoices.length){
                              _selectedChoices = [..._selectedChoices, tc];
                            }
                          }
                        },
                      );
                    },
                    isSelected: _selectedChoices.contains(tc),
                  ),
                )
                    .toList(),
                if (_multipleChoiceAnswer.otherField) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: ListTile(
                      title: TextField(
                        onChanged: (v) {
                          int? currentIndex;
                          final otherTextChoice = _selectedChoices
                              .firstWhereIndexedOrNull((index, element) {
                            final isOtherField = element.text == 'Other';

                            if (isOtherField) {
                              currentIndex = index;
                            }

                            return isOtherField;
                          });

                          setState(() {
                            if (v.isEmpty && otherTextChoice != null) {
                              _selectedChoices.remove(otherTextChoice);
                            } else if (v.isNotEmpty) {
                              final updatedTextChoice =
                              TextChoice(text: 'Other', value: v);
                              if (otherTextChoice == null) {
                                _selectedChoices.add(updatedTextChoice);
                              } else if (currentIndex != null) {
                                _selectedChoices[currentIndex!] =
                                    updatedTextChoice;
                              }
                            }
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Other',
                          labelStyle: Theme.of(context).textTheme.headlineSmall,
                          hintText: 'Write other information here',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
        //isValid: widget.questionStep.isOptional || _selectedChoices.isNotEmpty,
        title: widget.questionStep.title.isNotEmpty
            ? Text(
          widget.questionStep.title,
          style: Theme.of(context).textTheme.displayMedium,
          textAlign: TextAlign.center,
        )
            : widget.questionStep.content,
        resultFunction:() => InputQuestionResult(
          id: widget.questionStep.stepIdentifier,

          valueIdentifier:
          _selectedChoices.map((choices) => choices.value).join(','),
          result: _selectedChoices,
        ), );
  }
}
