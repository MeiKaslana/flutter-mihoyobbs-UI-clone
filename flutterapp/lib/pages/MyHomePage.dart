import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/request/mihoyo.dart';
import 'package:flutterapp/pages/home/home_page.dart';
import 'package:flutterapp/pages/movement/MovemenetPage.dart';
import 'package:flutterapp/pages/message/MessagePage.dart';
import 'package:flutterapp/pages/myinfo/MyInfoPage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final homescaffoldkey = new GlobalKey<ScaffoldState>(); //key的用法
  DateTime _lastClick = DateTime.now(); //最后一次按返回
  int _selectedIndex = 0;
  List<StatefulWidget> _widgetOptionsItem = [
    HomePage(),
    MovemenetPage(),
    MessagePage(),
    MyInfoPage()
  ];
  var _pageController = PageController(
    /// 初始索引值
    initialPage: 0,
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView(
          /// 控制跳转翻页的控制器
          controller: _pageController,

          /// Widget 组件数组 , 设置多个 Widget 组件
          children: _widgetOptionsItem,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              label: "首页",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore, color: Colors.grey),
                activeIcon: Icon(
                  Icons.explore,
                  color: Colors.blue,
                ),
                label: "动态"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.message,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.message,
                  color: Colors.blue,
                ),
                label: "消息"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_box,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.account_box,
                  color: Colors.blue,
                ),
                label: "我的"),
          ],
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: 'fatie',
          onPressed: () => setState(() {}),
          splashColor: Colors.blue,
          backgroundColor: Colors.blue,
          tooltip: 'Increment Counter',
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
      ),
    );
  }

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<bool> _checkDoubleClick() {
    print("_lastclick $_lastClick");
    print("now ${DateTime.now()}");
    if (_lastClick == null ||
        DateTime.now().difference(_lastClick) > Duration(seconds: 1)) {
      _lastClick = DateTime.now();
      // Fluttertoast.showToast(msg: "再按一次退出");
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
