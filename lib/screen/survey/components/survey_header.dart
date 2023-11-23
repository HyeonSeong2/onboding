import 'package:first/screen/survey/survey_view_model.dart';
import 'package:first/util/constant.dart';
import 'package:flutter/material.dart';

/// TODO: 결국 Header의 글자는 db에서 받음
/// 현재는 임의로 정적으로 만듦 -> 동적으로 어떤 Text를 파란색으로 걸러낼지
/// 설문지의 종류는 몇가지가 존재함, 버튼으로 클릭하는 것도 있기 때문에, 컴포넌트를 어떻게 나눌지도 생각
class SurveyHeader extends StatelessWidget {
  const SurveyHeader({required this.vm, super.key});

  final SurveyViewModel vm;

  @override
  Widget build(BuildContext context) {
    //text를 찾음
    //final searchText = vm.surveyModel!.data[vm.pageNum - 1].searchText();
    final question = vm.surveyModel!.data[vm.pageNum - 1].getQuestionSplit();
    //원형 에서 찾은 text값만 파란색으로 변경 해야함.
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  //isEven은 짝수 판별.
                  //0,1,2,3
                  ...List.generate(question.length, (index) {
                    if (!index.isEven) {
                      // "<b>"를 포함한 부분은 파란색으로 스타일을 지정
                      return TextSpan(
                        text: question[index].replaceAll("<b>", ""), // "<b>" 제거
                        style: TextStyle(
                          color: ihpColor,
                          fontSize: 20,
                          height: 1.2,
                          fontWeight: FontWeight.w700,
                        ),
                      );
                    } else {
                      // "<b>"를 포함하지 않은 부분은 기본 검은색으로 스타일을 지정
                      return TextSpan(
                        text: question[index],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          height: 1.2,
                          fontWeight: FontWeight.w700,
                        ),
                      );
                    }
                  }),
                ],
              ),
            ),
          ),
          Text(
            "${vm.pageNum}/${vm.surveyModel!.data.length}",
            style: pageNationTextStyle,
          ),
        ],
      ),
    );
    ;
  }
}
