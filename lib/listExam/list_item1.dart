import 'package:flutter/material.dart';

class ListHeader extends StatelessWidget {
  const ListHeader(this.value, {super.key});
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
