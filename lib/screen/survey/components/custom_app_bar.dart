import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });
  @override
  Size get preferredSize => Size.fromHeight(86);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: SizedBox(),
      title: Center(
        child: Text(
          "설문조사",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.clear),
        ),
      ],
    );
  }
}
