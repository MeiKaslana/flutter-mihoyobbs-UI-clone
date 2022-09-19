import 'package:flutter/material.dart';

class MyInfoBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  const MyInfoBar({
    this.height: 46.0,
  });
  @override
  Size get preferredSize => Size.fromHeight(height);
  @override
  _MyInfoBarState createState() => _MyInfoBarState();
}

class _MyInfoBarState extends State<MyInfoBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      title: Text("会员购"),
      actions: <Widget>[
        IconButton(
          icon: Icon(IconData(0xe606, fontFamily: "Bilibili")),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(IconData(0xe667, fontFamily: "Bilibili")),
          onPressed: () {},
        ),
      ],
    );
  }
}
