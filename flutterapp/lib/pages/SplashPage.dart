import 'package:flutter/material.dart';
import 'package:flutterapp/main.dart';
import 'package:flutterapp/model/SplashModel.dart';
import 'package:flutterapp/pages/MyHomePage.dart';
import 'dart:convert';
import 'package:flutterapp/request/mihoyo.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isUserLoginPage = false;
  late mihoyo futureMihoyo;
  String SplashPath = "";
  List<SplashItem> splashlist = <SplashItem>[];
  @override
  void initState() {
    super.initState();
    //开启倒计时
    TimeCounter();
  }

  Future<void> TimeCounter() async {
    splashlist.clear();
    splashlist.addAll(await mihoyo.getSplashList());
    if (!splashlist.isEmpty) {
      setState(() {
        SplashPath = splashlist[0].splash_image;
      });
    }
    var duration = new Duration(seconds: 1);
    new Future.delayed(duration, goToHomePage);
  }

  void goToHomePage() {
    //如果页面还未跳转过则跳转页面
    if (!isUserLoginPage) {
      //跳转主页 且销毁当前页面
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(builder: (context) => new MyHomePage()),
          (Route<dynamic> rout) => false);
      isUserLoginPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!splashlist.isEmpty) {
      return Container(
          child: Image.network(
        SplashPath,
        fit: BoxFit.cover,
      ));
    } else {
      return Container(child: Container(color: Colors.white));
    }
  }
}
