class SurveyPageModel {
  String question;
  List<String> answer;
  String selectType;

  SurveyPageModel({
    required this.question,
    required this.answer,
    required this.selectType,
  });

  factory SurveyPageModel.fromJson(Map<String, dynamic> json) {
    return SurveyPageModel(
      question: json["question"] ?? "",
      answer: (json["answer"] as Iterable).map<String>((e) => e).toList(),
      // answer: List<String>.from(json['answer'].map((e) => e)),
      selectType: json["selectType"] ?? "",
    );
  }

  String searchText() {
    print("blueTxt 호출");
    //<b>태그 사이 text추출
    RegExp regex = RegExp(r'<b>(.*?)<b>');
    RegExpMatch? match = regex.firstMatch(question);
    if (match != null) {
      String blueText = match.group(1)!;
      return blueText;
    }
    return "";
  }

  //<b>를 기준으로 split
  // 123<b>456<b>789  = ['123','456',789']
  List<String> getQuestionSplit() {
    var split = question.split("<b>");
    return split;
  }
}
