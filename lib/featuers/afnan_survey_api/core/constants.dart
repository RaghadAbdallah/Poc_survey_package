// Ex: const String cName = '';


// APIs

class URLConstant {
   static String base =  "http://10.0.2.42/";
  static String get apiBase => '${base}NoorMobileAPI/'; // TODO refactor to handle base value change dynamically
  static String get apiBaseURL => '${apiBase}NoorMobileApp/api/';
  static String get getNewSurvey => '${apiBaseURL}NewSurvey';
  static String get getAnswerSurvey => '${apiBaseURL}AnswerSurvey';

}


