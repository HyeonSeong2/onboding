// import 'package:first/screen/survey/components/custom_app_bar.dart';
// import 'package:first/screen/survey/components/custom_wheel_scroll.dart';
// import 'package:first/screen/survey/components/survey_header.dart';
// import 'package:first/screen/survey/survey_view_model.dart';
// import 'package:first/screen/survey/survy_sucess_screen.dart';
// import 'package:first/util/constant.dart';
// import 'package:flutter/material.dart';
//
// import 'components/survey_bottom_btn.dart';
//
// class ItchMaxSelectScreen extends StatefulWidget {
//   const ItchMaxSelectScreen({super.key});
//
//   @override
//   State<ItchMaxSelectScreen> createState() => _ItchMaxSelectScreenState();
// }
// // 페이지 전환 시 데이터 가지고 있어야함. 두번째 페이지에서10 선택 후다음 -> 이전페이지로 돌아오면 1로 초기화 됨.
// // 버튼 활성 , 비활성 -> 다른 폼 이있을 수도 있음.
// // 상태관리
//
// //View단에서 listner가 있어야 들을 수 있음.
//
// class _ItchMaxSelectScreenState extends State<ItchMaxSelectScreen> {
//   final SurveyViewModel vm = SurveyViewModel();
//
//   @override
//   void initState() {
//     //ViewModel의 notifyListeners 호출 리스너
//     vm.addListener(() {
//       setState(() {});
//     });
//     //데이터 초기화
//     vm.init();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     vm.removeListener(() {});
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(),
//       body: Column(
//         children: [
//           SurveyHeader(),
//           SizedBox(height: 75),
//           CustomWheelScroll(),
//           SizedBox(height: 56),
//         ],
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.only(left: 24, right: 24, bottom: 40),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: SurveyBottomBtn(
//                   text: '이전',
//                   textColor: gray40,
//                   backgroundColor: whiteColor,
//                   onPressed: () {
//                     Navigator.pop(context);
//                   }),
//             ),
//             SizedBox(width: 8),
//             Expanded(
//               child: SurveyBottomBtn(
//                   text: '제출',
//                   textColor: whiteColor,
//                   backgroundColor: ihpColor,
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => SurveySucessScreen()));
//                   }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// Widget _richText() {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 24),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text.rich(
//           TextSpan(
//             children: [
//               TextSpan(text: "지난 24시간동안 ", style: commentStyle),
//               TextSpan(
//                   text: "가장 심했던 가려움\n",
//                   style: TextStyle(
//                       color: ihpColor,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700)),
//               TextSpan(text: "은 어느 정도였습니까?\n", style: commentStyle),
//               TextSpan(text: "하나의 숫자를 선택해 주세요.", style: commentStyle),
//             ],
//           ),
//         ),
//
//         // 총 2페이지중 1페이지
//         Text("2/2", style: pageNationTextStyle),
//       ],
//     ),
//   );
// }
