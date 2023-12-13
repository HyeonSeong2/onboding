import 'package:first/listExam/exam_list.dart';
import 'package:flutter/material.dart';

class ListExamScreen extends StatelessWidget {
  const ListExamScreen({super.key});

  ///header,footer
  ///index 분기
  ///객체지향
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: headerAndFooterWithColumn(),
      ),
    );
  }
}

Widget headerAndFooterWithColumn() {
  return Column(
    children: [
      header(),
      Expanded(
        child: ListView.builder(
          itemCount: sample.length,
          itemBuilder: (context, index) {
            return item(sample[index]);
          },
        ),
      ),
      footer(),
    ],
  );
}

Widget header() {
  return Container(
    width: double.infinity,
    height: 100,
    color: Colors.amber,
    child: Text(
      "Header",
      style: TextStyle(fontSize: 20),
    ),
  );
}

Widget footer() {
  return Container(
    width: double.infinity,
    height: 100,
    color: Colors.green,
    child: Text(
      "Footer",
      style: TextStyle(fontSize: 20),
    ),
  );
}

Widget item(String value) {
  return Container(
    width: double.infinity,
    height: 100,
    color: Colors.grey,
    child: Text(
      value,
      style: TextStyle(fontSize: 20),
    ),
  );
}
