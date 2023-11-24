import 'package:first/screen/home_screen.dart';
import 'package:first/screen/survey/components/survey_bottom_btn.dart';
import 'package:first/util/constant.dart';
import 'package:flutter/material.dart';

class SurveySucessScreen extends StatelessWidget {
  const SurveySucessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/50_Fill_Noaml.png",
                fit: BoxFit.cover,
              ),
              SizedBox(height: 40),
              Text(
                "응답해 주셔서 감사합니다.\n내일 또 참여해주세요.",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 40),
        child: SurveyBottomBtn(
          text: '확인',
          textColor: white,
          backgroundColor: ihpColor,
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false);
          },
        ),
      ),
    );
  }
}
