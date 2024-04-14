import 'dart:developer';
import '../../../core/data/constants.dart';
import '../../../core/data/data_source/remote/network_helper.dart';
import '../model/new_survey_model.dart';

abstract class NewSurveyDataSource {
  Future<NewSurveyModel> getNewSurvey();
  Future<NewSurveyModel> getAnswerSurvey();
}
class NewSurveyDataSourceImpl implements NewSurveyDataSource {
  @override
  Future<NewSurveyModel> getNewSurvey() async {
    final dynamic response = await NetworkHelper.getData(endpoint: URLConstant.getNewSurvey);
    log('============ start getNewSurvey ===================');
    log(response.toString());
    log('============ end getNewSurvey ===================');
    return getUserTypeTechnicalModelFromJson( response );
  }

  @override
  Future<NewSurveyModel> getAnswerSurvey() async {
    final dynamic response = await NetworkHelper.getData(endpoint: URLConstant.getAnswerSurvey);
    log('============ start getAnswerSurvey ===================');
    log(response.toString());
    log('============ end getAnswerSurvey ===================');
    return getUserTypeTechnicalModelFromJson( response );

  }
}





