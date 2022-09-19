import 'dart:async';
import 'dart:convert';
import 'package:flutterapp/model/GameBlockModel.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutterapp/model/SplashModel.dart';
import 'package:flutterapp/model/GameModel.dart';
import 'package:dio/adapter.dart';
import 'package:flutter/material.dart';

import 'package:flutterapp/model/TipsPost.dart';

class mihoyo {
  static getSplashList() async {
    //获取获取会员购列表
    try {
      List<SplashItem> Splashlist = <SplashItem>[];
      HttpClient httpClient = new HttpClient();
      // HttpClientRequest request = await httpClient.getUrl(Uri.parse(
      //     'https://bbs-api.mihoyo.com/apihub/api/getAppSplash?stuid=24254666&stoken=v2_UGCrhvdD8TAx5UPqWLNZCJGddpzq6wAYpXAyCpblrwKeeCt-iBObi6yX29xyrYmtim7z-J3HdP3nmvH8ZT9ARzHAiAe7gsYYGiULMcjlBJbUog==&mid=0zcta4s155_mhy&login_ticket=jvoMGBtbHC6cygjzpDuV1beUUiJhbKfUmyF1xjF7'));
      HttpClientRequest request = await httpClient.getUrl(
          Uri.parse('https://bbs-api.mihoyo.com/apihub/api/getAppSplash'));
      HttpClientResponse response = await request.close();
      var result = await response.transform(utf8.decoder).join();
      var jsondata = json.decode(result);
      if (jsondata["data"]["has_splash"]) {
        for (var item in jsondata["data"]["splashes"]) {
          Splashlist.add(SplashItem.fromJson(item));
        }
        print("goods get ok");
        httpClient.close();
        return Splashlist;
      } else {
        return <SplashItem>[];
      }
    } catch (e) {
      print("goods请求失败");
      return <SplashItem>[];
    } finally {}
  }

  static getGameList() async {
    //获取获取会员购列表
    try {
      List<GameItem> Gamelist = <GameItem>[];
      HttpClient httpClient = new HttpClient();
      // HttpClientRequest request = await httpClient.getUrl(Uri.parse(
      //     'https://bbs-api.mihoyo.com/apihub/api/getGameList?stuid=24254666&stoken=v2_UGCrhvdD8TAx5UPqWLNZCJGddpzq6wAYpXAyCpblrwKeeCt-iBObi6yX29xyrYmtim7z-J3HdP3nmvH8ZT9ARzHAiAe7gsYYGiULMcjlBJbUog==&mid=0zcta4s155_mhy&login_ticket=jvoMGBtbHC6cygjzpDuV1beUUiJhbKfUmyF1xjF7'));
      HttpClientRequest request = await httpClient.getUrl(
          Uri.parse('https://bbs-api.mihoyo.com/apihub/api/getGameList'));
      HttpClientResponse response = await request.close();
      var result = await response.transform(utf8.decoder).join();
      var jsondata = json.decode(result);
      for (var item in jsondata["data"]["list"]) {
        Gamelist.add(GameItem.fromJson(item));
      }
      print("goods get ok");
      httpClient.close();
      return Gamelist;
    } catch (e) {
      print("goods请求失败");
      return <GameItem>[];
    } finally {}
  }

  static getGameBlock(String gameid) async {
    //获取获取会员购列表
    try {
      GameBlockModel GameSetting = GameBlockModel.getnull();
      HttpClient httpClient = new HttpClient();
      // HttpClientRequest request = await httpClient.getUrl(Uri.parse(
      //     'https://bbs-api.mihoyo.com/apihub/api/getGameList?stuid=24254666&stoken=v2_UGCrhvdD8TAx5UPqWLNZCJGddpzq6wAYpXAyCpblrwKeeCt-iBObi6yX29xyrYmtim7z-J3HdP3nmvH8ZT9ARzHAiAe7gsYYGiULMcjlBJbUog==&mid=0zcta4s155_mhy&login_ticket=jvoMGBtbHC6cygjzpDuV1beUUiJhbKfUmyF1xjF7'));
      HttpClientRequest request = await httpClient.getUrl(Uri.parse(
          'https://bbs-api.mihoyo.com/apihub/api/home/new?device=iPhone14%2C5&gids=$gameid'));
      HttpClientResponse response = await request.close();
      var result = await response.transform(utf8.decoder).join();
      var jsondata = json.decode(result);
      if (jsondata["data"] != null) {
        GameSetting = GameBlockModel.fromJson(jsondata["data"]);
      }
      print("goods get ok");
      httpClient.close();
      return GameSetting;
    } catch (e) {
      print("goods请求失败");
      return GameBlockModel.getnull();
    } finally {}
  }

  static getTips(String gameid) async {
    try {
      List<TipsPost> tipslist = <TipsPost>[];
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.getUrl(Uri.parse(
          'https://bbs-api.mihoyo.com/post/api/feeds/posts?fresh_action=1&gids=$gameid&is_first_initialize=false&last_id=21_99760'));
      HttpClientResponse response = await request.close();
      var result = await response.transform(utf8.decoder).join();
      var jsondata = json.decode(result);
      for (var item in jsondata["data"]["list"]) {
        tipslist.add(TipsPost.fromJson(item));
      }
      print("goods get ok");
      httpClient.close();
      return tipslist;
    } catch (e) {
      print("goods请求失败");
      return <TipsPost>[];
    } finally {}
  }

  // static getSettingsUnRead(String gameid) async {
  //   try {
  //     List<TipsPost> tipslist = <TipsPost>[];
  //     HttpClient httpClient = new HttpClient();
  //     HttpClientRequest request = await httpClient.getUrl(Uri.parse(
  //         'https://bbs-api.mihoyo.com/apihub/api/appPersonalUnRead'));
  // }
}
