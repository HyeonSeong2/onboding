import 'package:first/screen/survey/components/custom_app_bar.dart';
import 'package:first/screen/survey/components/custom_wheel_scroll.dart';
import 'package:first/screen/survey/components/survey_bottom_btn.dart';
import 'package:first/screen/survey/components/survey_header.dart';
import 'package:first/screen/survey/itch_max_select.dart';
import 'package:first/screen/survey/survey_view_model.dart';
import 'package:first/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ItchAvgSelectScreen extends StatefulWidget {
  const ItchAvgSelectScreen({super.key});

  @override
  State<ItchAvgSelectScreen> createState() => _ItchAvgSelectScreenState();
}

class _ItchAvgSelectScreenState extends State<ItchAvgSelectScreen> {
  final SurveyViewModel vm = SurveyViewModel();
  late PageController pageController = PageController(initialPage: 1);

  /// 따로 선언한 이유
  /// 리스너 null, removeListener를 하기 위함.
  /// 23일 할 것 : 1. PageView로 바꾸기, 받아온 데이터 입히기
  /// vm에 데이터 저장하기
  Function()? listener;

  @override
  void initState() {
    //ViewModel의 notifyListeners 호출 리스너
    listener = () {
      setState(() {});
    };
    vm.addListener(listener!);
    //데이터 초기화
    vm.init();
    super.initState();
  }

  @override
  void dispose() {
    //리스너 메모리 해제
    pageController.dispose();
    vm.removeListener(listener!);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (vm.surveyModel == null) {
      Logger().d("surveyModel = ${vm.surveyModel}");
      return Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            //item = page length
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  vm.pageNum = value + 1;
                });
              },
              itemCount: vm.surveyModel!.data.length,
              itemBuilder: (context, index) => Column(
                children: [
                  SurveyHeader(vm: vm),
                  SizedBox(height: 75),
                  CustomWheelScroll(),
                  SizedBox(height: 56),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 40),
        child: Row(
          children: [
            Expanded(
              child: SurveyBottomBtn(
                  text: '이전',
                  textColor: gray40,
                  backgroundColor: whiteColor,
                  onPressed: () {
                    setState(() {
                      vm.back();
                      pageController.jumpToPage(vm.pageNum);
                    });
                  }),
            ),
            SizedBox(width: 8),
            Expanded(
              child: SurveyBottomBtn(
                  text: '다음',
                  textColor: whiteColor,
                  backgroundColor: ihpColor,
                  onPressed: () {
                    setState(() {
                      vm.next();
                      pageController.jumpToPage(vm.pageNum);
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
