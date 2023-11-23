import 'package:first/screen/survey/components/survey_bottom_btn.dart';
import 'package:first/screen/survey/itch_average_select.dart';
import 'package:first/screen/survey/components/custom_app_bar.dart';
import 'package:first/util/constant.dart';
import 'package:flutter/material.dart';

class SurveyIntroScreen extends StatelessWidget {
  const SurveyIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              "0점(가려움 없음)부터 \n10점(상상할 수 있는 최악의 가려움)까지의\n척도로 가려운 정도를 입력해주세요.",
              textAlign: TextAlign.start,
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
          textColor: whiteColor,
          backgroundColor: ihpColor,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ItchAvgSelectScreen()));
          },
        ),
      ),
    );
  }
}
