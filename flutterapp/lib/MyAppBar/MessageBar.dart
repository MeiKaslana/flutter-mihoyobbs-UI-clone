import 'package:flutter/material.dart';

class MessageBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  const MessageBar({
    this.height: 46.0,
  });
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
  @override
  _MessageBarState createState() => _MessageBarState();
}

class _MessageBarState extends State<MessageBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      title: Text("动态"),
      actions: <Widget>[
        IconButton(
          icon: Icon(IconData(0xe61e, fontFamily: "Bilibili")),
          onPressed: () {},
        ),
      ],
    );
  }
}
