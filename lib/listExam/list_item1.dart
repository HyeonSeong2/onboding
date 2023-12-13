import 'package:flutter/material.dart';

class ListItem1 extends StatelessWidget {
  const ListItem1(this.value, {super.key});
  final value;
  @override
  Widget build(BuildContext context) {
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
}
