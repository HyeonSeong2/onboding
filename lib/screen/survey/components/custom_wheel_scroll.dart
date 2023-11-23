import 'package:flutter/material.dart';

class CustomWheelScroll extends StatefulWidget {
  const CustomWheelScroll({super.key});

  @override
  State<CustomWheelScroll> createState() => _CustomWheelScrollState();
}

class _CustomWheelScrollState extends State<CustomWheelScroll> {
  final List<int> survyValue = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  late int selectValue = 5;

  late final FixedExtentScrollController _controller;

  @override
  void initState() {
    _controller = FixedExtentScrollController(initialItem: selectValue - 1);
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
              children: List.generate(
                survyValue.length,
                (index) => Center(
                  child: Text(
                    "${survyValue[index]}",
                    style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.w700,
                        color: selectValue == survyValue[index]
                            ? Color(0xff0F66CE)
                            : Color(0xff808080)),
                  ),
                ),
              ),
              onSelectedItemChanged: (index) {
                print('select value ${survyValue[index]}');
                setState(() {
                  selectValue = survyValue[index];
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
