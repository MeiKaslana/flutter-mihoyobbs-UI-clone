import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovemenetBar extends StatefulWidget implements PreferredSizeWidget {
  final double height;
  const MovemenetBar({
    this.height: 46.0,
  });
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
  @override
  _MovemenetBarState createState() => _MovemenetBarState();
}

class _MovemenetBarState extends State<MovemenetBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      title: Text("动态"),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(IconData(0xe672, fontFamily: "Bilibili")),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(IconData(0xe669, fontFamily: "Bilibili")),
          onPressed: () {
            // Navigator.push(
            //     context,
            //     new CupertinoPageRoute(
            //         builder: (contex) => new SearchIndexPage())); //改为侧滑切换动画
          },
        ),
      ],
    );
  }
}
