import 'dart:convert';
import 'dart:developer';
 import '../../../../../core/data/data_source/remote/network_helper.dart';
import '../../../../core/resource/constants.dart';
import '../model/new_survey_model.dart';

abstract class NewSurveyDataSourece {
  Future<NewSurveyModel> getNewSurvey();
  Future<NewSurveyModel> getAnswerSurvey();
}
class NewSurveyDataSoureceImpl implements NewSurveyDataSourece {
  @override
  Future<NewSurveyModel> getNewSurvey() async {
    final dynamic response = await NetworkHelper.getData(endpoint: URLConstant.getNewSurvey);

    log('============ start getNewSurvey ===================');
    log(response.toString()); // تحقق من بيانات الاستجابة
    log('============ end getNewSurvey ===================');

    // تحويل النص إلى كائن JSON
    final Map<String, dynamic> jsonData = json.decode(response);

    // استخدام الدالة المناسبة لتحويل الكائن JSON إلى NewSurveyModel
    return NewSurveyModel.fromJson(jsonData);
  }  @override
  Future<NewSurveyModel> getAnswerSurvey() async {
    final dynamic response = await NetworkHelper.getData(endpoint: URLConstant.getAnswerSurvey);

    log('============ start getAnswerSurvey ===================');
    log(response.toString()); // تحقق من بيانات الاستجابة
    log('============ end getAnswerSurvey ===================');

    // تحويل النص إلى كائن JSON
    final Map<String, dynamic> jsonData = json.decode(response);

    // استخدام الدالة المناسبة لتحويل الكائن JSON إلى NewSurveyModel
    return NewSurveyModel.fromJson(jsonData);
  }
}





