import 'package:flutter/material.dart';

class ListItem2 extends StatelessWidget {
  const ListItem2(this.value, {super.key});
  final value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.red,
      child: Text(
        value,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
