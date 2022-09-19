import 'package:flutter/material.dart';
import 'package:flutterapp/model/GameBlockModel.dart';
import 'package:flutterapp/model/TipsPost.dart';

import 'package:url_launcher/url_launcher.dart';

List<Widget> navigaorView(List<NavigatorModel> navigatorlist) {
  return navigatorlist.map((NavigatorModel item) {
    return GestureDetector(
      child: Row(
        children: <Widget>[
          Column(children: <Widget>[
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(item.icon))),
            ),
            Text(item.name,
                style: const TextStyle(color: Colors.white, fontSize: 11))
          ]),
          Container(
            width: 20,
          )
        ],
      ),
      onTap: () {
        _launchURL(item);
      },
    );
  }).toList();
}

List<Widget> tipsView(List<TipsPost> tipslist) {
  return tipslist.map((TipsPost item) {
    return GestureDetector(
      child: Container(
          height: 220,
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Container(
                            width: 30,
                            height: 30,
                            child: item.avatar_url == ''
                                ? Image.asset('images/bili_default_avatar.png')
                                : Image.network(item.avatar_url)),
                        Text(item.nickname == '' ? 'net error' : item.nickname)
                      ],
                    )),
                Align(
                  alignment: Alignment.topRight,
                  child: Row(children: [
                    Text(item.is_followed == '' ? 'net error' : "+ 关注"),
                    Icon(Icons.more_horiz),
                  ]),
                )
              ]),
              SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    spacing: 10.0,
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.start,
                    children: [
                      Text(item.subject == '' ? 'net error' : item.subject,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ))
                    ],
                  )),
              SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    spacing: 10.0,
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.start,
                    children: [
                      Text(
                        item.content == '' ? 'net error' : item.content,
                        maxLines: 2,
                      )
                    ],
                  )),
              item.images.length > 0
                  ? Container(height: 60, child: _imagelist(item.images))
                  : Container(
                      height: 60,
                      child: Image.asset('images/bili_default_avatar.png')),
              SizedBox(height: 5),
              SizedBox(
                  height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            decoration: BoxDecoration(color: Colors.grey),
                            child: Text(
                                item.forum == '' ? 'net error' : item.forum),
                          )),
                      Align(
                          alignment: Alignment.topRight,
                          child: Row(
                            children: [
                              Icon(Icons.visibility),
                              SizedBox(
                                width: 3,
                              ),
                              Text(item.view_num == ''
                                  ? 'net error'
                                  : item.view_num),
                              SizedBox(
                                width: 3,
                              ),
                              Icon(Icons.textsms_outlined),
                              SizedBox(
                                width: 3,
                              ),
                              Text(item.reply_num == ''
                                  ? 'net error'
                                  : item.reply_num),
                              SizedBox(
                                width: 3,
                              ),
                              Icon(Icons.thumb_up_alt_outlined),
                              SizedBox(
                                width: 3,
                              ),
                              Text(item.like_num == ''
                                  ? 'net error'
                                  : item.like_num),
                            ],
                          ))
                    ],
                  )),
              Divider(
                height: 1.0,
                indent: 60.0,
                color: Colors.grey,
              ),
            ],
          )),
      onTap: () {},
    );
  }).toList();
}

Widget _imagelist(List imagelist) {
  return GridView.builder(
    itemCount: imagelist.length > 2 ? 2 : imagelist.length,
    physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.all(5),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      crossAxisCount: 4,
      childAspectRatio: 1,
    ),
    // itemBuilder: (context,i){
    //   return ChannelCard(channellist[i]);
    // },
    itemBuilder: (context, i) {
      return Image.network(imagelist[i]);
    },
  );
}

_launchURL(NavigatorModel item) async {
  if (await canLaunch(item.app_path)) {
    await launch(item.app_path);
  } else {
    throw 'Could not launch $item.app_path';
  }
}
