import 'package:flutter/material.dart';

class ListFooter extends StatelessWidget {
  const ListFooter({super.key});

  @override
  Widget build(BuildContext context) {
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
}
