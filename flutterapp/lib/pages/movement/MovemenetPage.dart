import 'package:flutter/material.dart';
// import 'package:flutter_MyBilibili/model/jsonmodel/ChannelItem.dart';
// import 'package:flutter_MyBilibili/util/GetUtilBilibili.dart';

class MovemenetPage extends StatefulWidget {
  @override
  _MovemenetPageState createState() => _MovemenetPageState();
}

class _MovemenetPageState extends State<MovemenetPage> {
  // List<ChannelItem> channellist=List<ChannelItem>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getChannelList();
  }

  getChannelList() async {
    // channellist.addAll(await GetUtilBilibili.getChannelList());
    setState(() {});
  }

  Future<void> _onrefresh() async {
    // channellist.clear();
    // channellist.addAll(await GetUtilBilibili.getChannelList());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          elevation: 0.0,
          centerTitle: true,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
            Text("关注", style: TextStyle(color: Colors.black)),
            SizedBox(
              width: 20,
            ),
            Text("发现", style: TextStyle(color: Colors.black))
          ]),
          actions: <Widget>[
            TextButton(
                onPressed: () {},
                child: Text(
                  "发动态",
                  style: TextStyle(color: Colors.black),
                )),
          ],
        ),
        body: Container(
          color: Colors.white,
          alignment: Alignment.topCenter,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/dynamic_login_guide.png"),
                      fit: BoxFit.fitWidth)),
            ),
          ),
        ));
  }
}
