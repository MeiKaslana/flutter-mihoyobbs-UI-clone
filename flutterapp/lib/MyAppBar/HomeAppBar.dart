import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterapp/request/mihoyo.dart';
import 'package:flutterapp/model/GameModel.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  //final Image ic_head;
  final GlobalKey<ScaffoldState> homescaffoldkey;
  final double height;
  const HomeAppBar({this.height: 46.0, required this.homescaffoldkey});
  Size get preferredSize => Size.fromHeight(height);
  @override
  _HomeAppBarState createState() =>
      _HomeAppBarState(homescaffoldkey: homescaffoldkey);
}

class _HomeAppBarState extends State<HomeAppBar> {
  //final Image ic_head;
  _HomeAppBarState({required this.homescaffoldkey});
  final GlobalKey<ScaffoldState> homescaffoldkey;
  List<GameItem> gamelist = <GameItem>[];
  final List<String> tabs = [
    "直播",
    "推荐",
    "热门",
    "直播",
    "推荐",
    "热门",
    "直播",
  ];
  void _opendrawer() {
    homescaffoldkey.currentState?.openDrawer();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initTab();
  }

  Future<void> initTab() async {
    gamelist.clear();
    gamelist.addAll(await mihoyo.getGameList());
    setState(() {
      tabs.clear();
      for (var item in gamelist) {
        tabs.add(item.name);
      }
    });
  }

  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: AppBar(
            elevation: 0.0,
            leading: GestureDetector(
              child: Center(
                child: Icon(Icons.search),
              ),
              onTap: () {
                _opendrawer();
              },
            ),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[]),
            actions: <Widget>[
              Center(
                child: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
              )
            ]));
  }
}
