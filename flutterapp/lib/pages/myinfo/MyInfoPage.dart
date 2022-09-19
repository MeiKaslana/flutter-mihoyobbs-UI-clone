import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_MyBilibili/model/jsonmodel/GoodItem.dart';
// import 'package:flutter_MyBilibili/util/GetUtilBilibili.dart';

class MyInfoPage extends StatefulWidget {
  @override
  _MyInfoPageState createState() => _MyInfoPageState();
}

class _MyInfoPageState extends State<MyInfoPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(children: [
          Stack(children: [
            Image.asset("images/miyosettingsbackground.png"),
            Column(children: [
              SizedBox(
                height: 129,
              ),
              Row(children: [
                SizedBox(
                  width: 22,
                ),
                ClipOval(
                  child: Image.asset("images/AppIcon60x60@2x.png",
                      width: 80, height: 80, fit: BoxFit.cover),
                )
              ])
            ])
          ]),
          SizedBox(
            height: 5,
          ),
          Row(children: [
            SizedBox(
              width: 20,
            ),
            Align(child: Text("点击登录"), alignment: Alignment.topLeft)
          ]),
          Row(children: [
            SizedBox(
              width: 20,
            ),
            Align(child: Text("登陆解锁更多精彩内容"), alignment: Alignment.topLeft)
          ]),
          Divider(
            height: 10.0,
            indent: 0.0,
            color: Colors.grey,
          ),
          Row(children: [
            SizedBox(
              width: 20,
            ),
            Align(child: Text("米游币"), alignment: Alignment.topLeft)
          ]),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
                child: Center(child: Text("获取米游币")),
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey[200])),
            Container(
                child: Center(child: Text("兑换中心")),
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey[200])),
          ]),
          SizedBox(
            height: 20,
          ),
          Divider(
            height: 10.0,
            indent: 0.0,
            color: Colors.grey,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              width: double.infinity,
              height: 180,
              child: GridView.count(
                //默认主轴竖直
                crossAxisCount: 4, //交叉轴显示矿建个数
                crossAxisSpacing: 16, //交叉轴间距
                mainAxisSpacing: 16, //主轴间距
                // scrollDirection: Axis.horizontal,//水平滚动
                padding: EdgeInsets.all(16),
                children: _buildGridItem(7),
              )),
          Divider(
            height: 10.0,
            indent: 0.0,
            color: Colors.grey,
          ),
          Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [Icon(Icons.time_to_leave), Text("限时活动")],
                  )
                ],
              )),
          Divider(
            height: 10.0,
            indent: 0.0,
            color: Colors.grey,
          ),
          Container(
              height: 40,
              child: Row(children: [Icon(Icons.time_to_leave), Text("联系客服")])),
          Divider(
            height: 10.0,
            indent: 0.0,
            color: Colors.grey,
          ),
          Container(
              height: 40,
              child: Row(children: [Icon(Icons.time_to_leave), Text("青少年模式")])),
        ]));
  }
}

List<Widget> _buildGridItem(int count) {
  List<Widget> results = [];
  List<String> items = ["我的角色", "游戏中心", "收藏", "浏览历史", "米游铺", "创作中心", "我的奖品"];
  for (var i = 0; i < count; i++) {
    results.add(MyContainer(Icon(Icons.textsms, color: Colors.blue), items[i]));
  }
  return results;
}

class MyContainer extends StatelessWidget {
  Icon _icon;
  String _content;
  MyContainer(this._icon, this._content);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, 0),
      child: Column(
        children: [
          _icon,
          Text(_content,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue))
        ],
      ),
    );
  }
}
