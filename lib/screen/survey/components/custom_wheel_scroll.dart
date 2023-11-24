import 'package:first/domain/model/survey_model.dart';
import 'package:first/domain/model/survey_page_model.dart';
import 'package:first/screen/survey/survey_view_model.dart';
import 'package:first/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:logger/logger.dart';

class CustomWheelScroll extends StatefulWidget {
  const CustomWheelScroll({required this.vm, super.key});
  final SurveyViewModel vm;
  @override
  State<CustomWheelScroll> createState() => _CustomWheelScrollState();
}

class _CustomWheelScrollState extends State<CustomWheelScroll> {
  //선택한 값을 담을 변수
  late FixedExtentScrollController _controller;
  SurveyViewModel get vm => widget.vm;
  @override
  void initState() {
    if (vm.selectValue[vm.pageNum] == null) {
      vm.selectValue[vm.pageNum] =
          (vm.surveyModel!.data[vm.pageNum - 1].answer.length / 2).floor();
    }
    _controller =
        FixedExtentScrollController(initialItem: vm.selectValue[vm.pageNum]!);
    Logger().d("vm.selectValue[vm.pageNum]! :${vm.selectValue[vm.pageNum]!}");
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Positioned(
            child: Center(
              child: Container(
                height: 107,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Color(0xff808080), width: 0.5),
                    bottom: BorderSide(color: Color(0xff808080), width: 0.5),
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(),
            child: ListWheelScrollView(
              controller: _controller,
              physics: FixedExtentScrollPhysics(),
              diameterRatio: 2,
              squeeze: 1.2,
              itemExtent: 107,
              perspective: 0.0001,
              onSelectedItemChanged: (index) {
                setState(() {
                  vm.selectValue[widget.vm.pageNum] = index;
                  print('select value check ${vm.selectValue}');
                });
              },
              children: List.generate(
                  vm.surveyModel!.data[vm.pageNum - 1].answer.length, (index) {
                bool selected = vm.selectValue[vm.pageNum] == index;
                return Center(
                  child: Text(
                    //answer index
                    vm.surveyModel!.data[vm.pageNum - 1].answer[index],
                    style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.w700,
                        //선택한 값과 현재의 값이 같다면 blue
                        color: selected ? ihpColor : gray90),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
