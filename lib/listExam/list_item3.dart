import 'package:flutter/material.dart';

class ListItem3 extends StatelessWidget {
  const ListItem3(this.value, {super.key});
  final value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.blue,
      child: Text(
        value,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
