import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_MyBilibili/pages/me/LoginPage.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          elevation: 0.0,
          centerTitle: true,
          title: Text("消息", style: TextStyle(color: Colors.black)),
          actions: <Widget>[
            TextButton(
              onPressed: () {},
              child: Icon(Icons.settings),
            )
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
