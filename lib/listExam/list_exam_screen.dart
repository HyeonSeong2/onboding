import 'dart:html';

import 'package:first/listExam/exam_list.dart';
import 'package:first/listExam/list_enum.dart';
import 'package:first/listExam/list_footer.dart';
import 'package:first/listExam/list_item1.dart';
import 'package:first/listExam/list_item2.dart';
import 'package:first/listExam/list_item3.dart';
import 'package:first/util/pair.dart';
import 'package:flutter/material.dart';

import 'list_header.dart';

class ListExamScreen extends StatefulWidget {
  const ListExamScreen({Key? key}) : super(key: key);

  @override
  State<ListExamScreen> createState() => _ListExamScreenState();
}

class _ListExamScreenState extends State<ListExamScreen> {
  List<ListParent> parents = [];

  void setData() {
    for (var data in sample2) {
      if (data.first == ListEnum.header) {
        parents.add(ListChild(const SizedBox(), ListEnum.header));
      } else if (data.first == ListEnum.footer) {
        parents.add(ListChild(const SizedBox(), ListEnum.footer));
      } else if (data.first == ListEnum.item1) {
        parents.add(ListChild(ListItem1(data.second), ListEnum.item1));
      } else if (data.first == ListEnum.item2) {
        parents.add(ListChild(ListItem2(data.second), ListEnum.item2));
      } else {
        parents.add(ListChild(ListItem3(data.second), ListEnum.item3));
      }
    }
  }

  /// header, footer
  /// 1. Column 사용 - 헤더, 푸터가 고정
  /// 2. index 분기 처리 -
  /// 3. 객체지향 활용
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: headerAndFooterWithOOP(),
    );
  }

  Widget headerAndFooterWithColumn() {
    return Column(
      children: [
        header(),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
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

  Widget headerAndFooterWithIndex() {
    return ListView.builder(
      itemCount: sample.length,
      itemBuilder: (context, index) {
        Widget child = item(sample[index]);

        /// before data의 날짜
        /// current data의 날짜
        /// before != current
        /// today 기준으로 미래, 오늘, 과거

        if (index == 0) {
          return Column(children: [header(), child]);
        }

        if (index == sample.length - 1) {
          return Column(children: [child, footer()]);
        }

        return child;
      },
    );
  }

  Widget headerAndFooterWithOOP() {
    return ListView.builder(
      itemCount: sample2.length,
      itemBuilder: (context, index) {
        Pair<ListEnum, String> data = sample2[index];
        if (data.first == ListEnum.header) {
          return header();
        } else if (data.first == ListEnum.footer) {
          return footer();
        } else if (data.first == ListEnum.item1) {
          return item(data.second);
        } else if (data.first == ListEnum.item2) {
          return item2(data.second);
        } else {
          return item3(data.second);
        }
      },
    );
  }

  Widget headerAndFooterWithOOP2() {
    return ListView.builder(
      itemCount: parents.length,
      itemBuilder: (context, index) {
        ListParent listParent = parents[index];

        listParent.listEnum;
        if (listParent.listEnum == ListEnum.header) {
          return const ListHeader();
        }
        if (listParent.listEnum == ListEnum.footer) {
          return const ListFooter();
        }
        listParent.listEnum == ListEnum.item2;
        return (listParent as ListChild).child;
      },
    );
  }

  Widget header() {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.purple,
      child: const Text(
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
      child: const Text(
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
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  Widget item2(String value) {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.red,
      child: Text(
        value,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  Widget item3(String value) {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.blue,
      child: Text(
        value,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
