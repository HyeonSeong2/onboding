import 'package:flutter/material.dart';

class ListHeader extends StatelessWidget {
  const ListHeader({super.key});

  @override
  Widget build(BuildContext context) {
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
}
