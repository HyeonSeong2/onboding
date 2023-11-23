import 'dart:convert';

import 'package:first/domain/model/survey_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

/// 페이지, 페이지 이동 모두 상태관리로 하기
class SurveyViewModel extends ChangeNotifier {
  //page, answer를 가진 변수
  Map<int, int> selectValue = {};
  int pageNum = 1;
  SurveyModel? surveyModel;

  // 데이터 초기화
  Future<void> init() async {
    var jsonValue = await rootBundle.loadString('survey_tickling_kr.json');

    Map<String, dynamic> surveyValue = jsonDecode(jsonValue);

    if (surveyValue == null) {
      Logger().d("surveyValue가 null입니다");
    }
    // typeError 발생 기존 코드 : surveyValue
    // 해결 - surveyValue["data"]
    surveyModel = SurveyModel.fromJson(surveyValue["data"]);
    notifyListeners();
  }

  //업데이트
  Future<void> update() async {
    notifyListeners();
  }

  Future<void> next() async {
    if (pageNum >= surveyModel!.data.length) {
      return;
    } else {
      pageNum++;
    }
  }

  Future<void> back() async {
    if (pageNum <= 1) {
      return;
    } else {
      pageNum--;
    }
  }

  //데이터 저장
  Future<void> add({required int page, required int answer}) async {
    selectValue[page] = answer;
  }
}