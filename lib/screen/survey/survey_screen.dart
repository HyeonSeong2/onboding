import 'package:first/screen/survey/components/custom_app_bar.dart';
import 'package:first/screen/survey/components/custom_wheel_scroll.dart';
import 'package:first/screen/survey/components/survey_bottom_btn.dart';
import 'package:first/screen/survey/components/survey_header.dart';
import 'package:first/screen/survey/survey_view_model.dart';
import 'package:first/screen/survey/survy_sucess_screen.dart';
import 'package:first/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({required this.vm, super.key});

  final SurveyViewModel vm;

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  // final SurveyViewModel vm = SurveyViewModel();
  late PageController pageController = PageController(initialPage: 1);
  SurveyViewModel get vm => widget.vm;

  /// 따로 선언한 이유
  /// 리스너 null, removeListener를 하기 위함.
  /// 23일 할 것 : 1. PageView로 바꾸기, 받아온 데이터 입히기
  /// vm에 데이터 저장하기
  // Function()? listener;
  //
  // @override
  // void initState() {
  //   //ViewModel의 notifyListeners 호출 리스너
  //   listener = () {
  //     setState(() {});
  //   };
  //   vm.addListener(listener!);
  //   //데이터 초기화
  //   vm.init();
  //   super.initState();
  // }

  @override
  void dispose() {
    //리스너 메모리 해제
    pageController.dispose();
    // vm.removeListener(listener!);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (vm.surveyModel == null) {
      return Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            //item = page length
            child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              // 스와이프 페이지 이동 없앰.
              onPageChanged: (value) {
                if (value == vm.pageNum) {
                  Logger().d("$value + setState호출");
                  setState(() {});
                }
                // setState(() {
                //   vm.pageNum = value + 1;
                // });
              },
              itemCount: vm.surveyModel!.data.length,
              itemBuilder: (context, index) => Column(
                children: [
                  SurveyHeader(vm: vm),
                  SizedBox(height: 75),
                  CustomWheelScroll(vm: vm),
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
                  backgroundColor: white,
                  onPressed: () {
                    pageController.jumpToPage(vm.pageNum);
                    vm.back(() {
                      setState(() {});
                    });
                  }),
            ),
            SizedBox(width: 8),
            Expanded(
              child: SurveyBottomBtn(
                text: vm.pageNum != vm.surveyModel!.data.length ? '다음' : "제출",
                textColor: white,
                backgroundColor: ihpColor,
                onPressed: () {
                  if (vm.pageNum != vm.surveyModel!.data.length) {
                    setState(() {
                      vm.next();
                      pageController.jumpToPage(vm.pageNum);
                    });
                  } else {
                    vm.add();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SurveySucessScreen()));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
