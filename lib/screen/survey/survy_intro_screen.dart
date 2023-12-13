import 'package:first/screen/survey/components/survey_bottom_btn.dart';
import 'package:first/screen/survey/components/custom_app_bar.dart';
import 'package:first/screen/survey/survey_screen.dart';
import 'package:first/screen/survey/survey_view_model.dart';
import 'package:first/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SurveyIntroScreen extends StatefulWidget {
  const SurveyIntroScreen({super.key});

  @override
  State<SurveyIntroScreen> createState() => _SurveyIntroScreenState();
}

class _SurveyIntroScreenState extends State<SurveyIntroScreen> {
  final SurveyViewModel vm = SurveyViewModel();

  Function()? listener;

  @override
  void initState() {
    //ViewModel의 notifyListeners 호출 리스너
    listener = () {
      setState(() {
        Logger().d("SetState 호출");
      });
    };
    vm.addListener(listener!);
    //데이터 초기화
    vm.init();
    super.initState();
  }

  @override
  void dispose() {
    //리스너 메모리 해제
    vm.removeListener(listener!);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (vm == null) {
      return Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Image.asset(
              "assets/survey.png",
              fit: BoxFit.cover,
            ),
            SizedBox(height: 24),
            Text(
              vm.surveyModel!.description,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              //style: introTextStyle
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 40),
        child: SurveyBottomBtn(
          text: '시작하기',
          textColor: white,
          backgroundColor: ihpColor,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SurveyScreen(vm: vm)));
          },
        ),
      ),
    );
  }
}
