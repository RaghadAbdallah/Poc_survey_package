// To parse this JSON data, do
//
//     final getUserTypeTechnicalModel = getUserTypeTechnicalModelFromJson(jsonString);

import 'dart:convert';

NewSurveyModel getUserTypeTechnicalModelFromJson(String str) => NewSurveyModel.fromJson(json.decode(str));

String getUserTypeTechnicalModelToJson(NewSurveyModel data) => json.encode(data.toJson());

class NewSurveyModel {
  String type;
  List<Step> steps;

  NewSurveyModel({
    required this.type,
    required this.steps,
  });

  factory NewSurveyModel.fromJson(Map<String, dynamic> json) => NewSurveyModel(
    type: json["type"],
    steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
  };
}

class Step {
  String type;
  String? text;
  String? buttonText;
  String? introSurvey;
  String? questionDesc;
  int? answerStatus;
  AnswerFormat? answerFormat;
  StepIdentifier? stepIdentifier;
  String? title;

  Step({
    required this.type,
    this.text,
    this.buttonText,
    this.introSurvey,
    this.questionDesc,
    this.answerStatus,
    this.answerFormat,
    this.stepIdentifier,
    this.title,
  });

  factory Step.fromJson(Map<String, dynamic> json) => Step(
    type: json["type"],
    text: json["text"],
    buttonText: json["buttonText"],
    introSurvey: json["introSurvey"],
    questionDesc: json["questionDesc"],
    answerStatus: json["answerStatus"],
    answerFormat: json["answerFormat"] == null ? null : AnswerFormat.fromJson(json["answerFormat"]),
    stepIdentifier: json["stepIdentifier"] == null ? null : StepIdentifier.fromJson(json["stepIdentifier"]),
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "text": text,
    "buttonText": buttonText,
    "introSurvey": introSurvey,
    "questionDesc": questionDesc,
    "answerStatus": answerStatus,
    "answerFormat": answerFormat?.toJson(),
    "stepIdentifier": stepIdentifier?.toJson(),
    "title": title,
  };
}

class AnswerFormat {
  String type;
  List<QuestionsResultSurveyList>? questionsResultSurveyList;
  int? optionStatus;
  double? maximumValue;
  double? minimumValue;
  double? defaultValue;
  double? step;

  AnswerFormat({
    required this.type,
    this.questionsResultSurveyList,
    this.optionStatus,
    this.maximumValue,
    this.minimumValue,
    this.defaultValue,
    this.step,
  });

  factory AnswerFormat.fromJson(Map<String, dynamic> json) => AnswerFormat(
    type: json["type"],
    questionsResultSurveyList: json["QuestionsResultSurveyList"] == null ? [] : List<QuestionsResultSurveyList>.from(json["QuestionsResultSurveyList"]!.map((x) => QuestionsResultSurveyList.fromJson(x))),
    optionStatus: json["optionStatus"],
    maximumValue: json["maximumValue"],
    minimumValue: json["minimumValue"],
    defaultValue: json["defaultValue"],
    step: json["step"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "QuestionsResultSurveyList": questionsResultSurveyList == null ? [] : List<dynamic>.from(questionsResultSurveyList!.map((x) => x.toJson())),
    "optionStatus": optionStatus,
    "maximumValue": maximumValue,
    "minimumValue": minimumValue,
    "defaultValue": defaultValue,
    "step": step,
  };
}

class QuestionsResultSurveyList {
  dynamic answerId;
  String? answerDesc;
  int optionStatus;

  QuestionsResultSurveyList({
    required this.answerId,
    required this.answerDesc,
    required this.optionStatus,
  });

  factory QuestionsResultSurveyList.fromJson(Map<String, dynamic> json) => QuestionsResultSurveyList(
    answerId: json["AnswerID"],
    answerDesc: json["AnswerDesc"],
    optionStatus: json["optionStatus"],
  );

  Map<String, dynamic> toJson() => {
    "AnswerID": answerId,
    "AnswerDesc": answerDesc,
    "optionStatus": optionStatus,
  };
}

class StepIdentifier {
  String id;

  StepIdentifier({
    required this.id,
  });

  factory StepIdentifier.fromJson(Map<String, dynamic> json) => StepIdentifier(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}
