import 'package:first/domain/model/survey_page_model.dart';
import 'package:logger/logger.dart';

class SurveyModel {
  String type;
  String title;
  String subTitle;
  String description;
  String completeMessage;
  List<SurveyPageModel> data;

  SurveyModel({
    required this.type,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.completeMessage,
    required this.data,
  });

  factory SurveyModel.fromJson(Map<String, dynamic> json) {
    return SurveyModel(
      type: json["type"] ?? "",
      title: json["title"] ?? "",
      subTitle: json["subTitle"] ?? "",
      description: json["description"] ?? "",
      completeMessage: json["completeMessage"] ?? "",
      // data: List<SurveyPageModel>.from(
      //     json["data"].map((e) => SurveyPageModel.fromJson(e))),
      data: (json["data"] as Iterable)
          .map<SurveyPageModel>((e) => SurveyPageModel.fromJson(e))
          .toList(),
    );
  }
}
