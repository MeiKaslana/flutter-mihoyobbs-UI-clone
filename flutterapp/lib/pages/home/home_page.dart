import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/model/GameBlockModel.dart';
import 'package:flutterapp/model/GameModel.dart';
import 'package:flutterapp/request/mihoyo.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutterapp/model/TipsPost.dart';
import 'NavigatorView.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TipsPost> tipslist = <TipsPost>[];
  List<TipsPost> forstatetipslist = <TipsPost>[];
  List<GameItem> tabs = <GameItem>[];
  GameBlockModel forstatesettings = GameBlockModel.getnull();
  GameBlockModel gameblocksettings = GameBlockModel.getnull();
  List<GameItem> gamelist = <GameItem>[];
  List<CarouselsModel> carouselslist = <CarouselsModel>[];
  String carouselsposition = "";
  late GameItem currentItem = GameItem.getnull();
  final List<Widget> tabViews = [];
  String backgroundpath = "";
  List<NavigatorModel> navigatorlist = <NavigatorModel>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initTab();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  Future<Null> _onLoading() async {
    //print('onAddcard');
    forstatesettings = await mihoyo.getGameBlock(tabs[0].id);
    forstatetipslist = await mihoyo.getTips(tabs[0].id);
    setState(() {
      tipslist = forstatetipslist;
      gameblocksettings = forstatesettings;
      backgroundpath = gameblocksettings.background;
      navigatorlist = gameblocksettings.navigatorlist;
      carouselsposition = gameblocksettings.carouselsposition;
      carouselslist = gameblocksettings.carouselslist;
    });
    _refreshController.loadComplete();
    if (mounted) setState(() {});
  }

  Future<Null> _onRefresh() async {
    forstatesettings = await mihoyo.getGameBlock(tabs[0].id);
    forstatetipslist = await mihoyo.getTips(tabs[0].id);
    setState(() {
      tipslist = forstatetipslist;
      gameblocksettings = forstatesettings;
      backgroundpath = gameblocksettings.background;
      navigatorlist = gameblocksettings.navigatorlist;
      carouselsposition = gameblocksettings.carouselsposition;
      carouselslist = gameblocksettings.carouselslist;
    });
    _refreshController.refreshCompleted();
    if (mounted) setState(() {});
  }

  ScrollController _scrollController = ScrollController(); //l
  RefreshController _refreshController =
      RefreshController(initialRefresh: true);
  int _selectedIndex = 0;
  Future<void> _onItemTapped(int index) async {
    setState(() {
      currentItem = gamelist[index];
      _selectedIndex = index;
    });
    forstatesettings = await mihoyo.getGameBlock(currentItem.id);
    forstatetipslist = await mihoyo.getTips(tabs[0].id);
    setState(() {
      tipslist = forstatetipslist;
      gameblocksettings = forstatesettings;
      backgroundpath = gameblocksettings.background;
      navigatorlist = gameblocksettings.navigatorlist;
      carouselsposition = gameblocksettings.carouselsposition;
      carouselslist = gameblocksettings.carouselslist;
    });
  }

  Future<void> initTab() async {
    tabs.clear();
    tabs.addAll(await mihoyo.getGameList());
    forstatesettings = await mihoyo.getGameBlock(tabs[0].id);
    forstatetipslist = await mihoyo.getTips(tabs[0].id);
    setState(() {
      tipslist = forstatetipslist;
      gameblocksettings = forstatesettings;
      backgroundpath = gameblocksettings.background;
      navigatorlist = gameblocksettings.navigatorlist;
      carouselsposition = gameblocksettings.carouselsposition;
      carouselslist = gameblocksettings.carouselslist;
      currentItem = tabs[0];
      gamelist = tabs;
      for (var item in gamelist) {
        tabViews.add(const SampleAppPage());
      }
    });
  }

  String getMessageTime(String ts) {
    String time = '';
    DateTime timeDate =
        DateTime.fromMillisecondsSinceEpoch(int.parse(ts) * 1000);

    time =
        "${timeDate.month.toString().padLeft(2, '0')}-${timeDate.day.toString().padLeft(2, '0')} ";

    return time;
  }

  ImageProvider _getBackground(String backgournd) {
    if (!backgournd.isEmpty) {
      return NetworkImage(backgournd);
    } else {
      return const AssetImage('images/bili_default_avatar.png');
    }
  }

  Image _getImage(String imagepath) {
    if (!imagepath.isEmpty) {
      return Image.network(
        imagepath,
        width: 60,
        height: 60,
        alignment: Alignment.center,
      );
    } else {
      return Image.asset('images/bili_default_avatar.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: SafeArea(
            //安全区域内的组件不会被遮挡
            child: DefaultTabController(
                length: gamelist.length,
                initialIndex: 1, //默认选中
                child: Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                      backgroundColor: Colors.transparent, //此处应有渐变
                      elevation: 0.0,
                      leading: Center(
                        child: IconButton(
                          icon: const Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      title: TabBar(
                        onTap: _onItemTapped,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        isScrollable: true, //设置为可以滚动
                        tabs: gamelist.map((GameItem item) {
                          return new Container(
                            height: 35,
                            child: Tab(
                              text: item.name,
                            ),
                          );
                        }).toList(),
                      ),
                      actions: <Widget>[
                        Center(
                          child: IconButton(
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                    body: SmartRefresher(
                        enablePullUp: true,
                        controller: _refreshController,
                        onRefresh: _onRefresh,
                        onLoading: _onLoading,
                        footer: CustomFooter(
                          builder: (context, mode) {
                            Widget body;
                            if (mode == LoadStatus.loading) {
                              body = const CupertinoActivityIndicator();
                            } else {
                              body = const Center(
                                child: Text(
                                  "正在加载",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            }
                            return Container(
                              height: 30,
                              child: body,
                            );
                          },
                        ),
                        child: ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            const SizedBox(
                              height: 7,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: _getBackground(backgroundpath),
                                    fit: BoxFit.cover,
                                    repeat: ImageRepeat.noRepeat,
                                  ),
                                ),
                                child: Column(children: [
                                  Container(
                                      margin: const EdgeInsets.all(10),
                                      height: 70,
                                      child: ListView(
                                          scrollDirection:
                                              Axis.horizontal, // 水平滚动
                                          children:
                                              (navigaorView(navigatorlist)))),
                                  Container(
                                      margin: const EdgeInsets.all(10),
                                      height: 70,
                                      color: Colors.white,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(width: 5),
                                              Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: _getImage(
                                                      gameblocksettings
                                                          .discussion.icon)),
                                              const SizedBox(
                                                width: 7,
                                              ),
                                              Container(
                                                  width: 220,
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                              gameblocksettings
                                                                  .discussion
                                                                  .title,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ))),
                                                      const SizedBox(
                                                        height: 7,
                                                      ),
                                                      Container(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Text(
                                                            gameblocksettings
                                                                .discussion
                                                                .prompt,
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                            )),
                                                      )
                                                    ],
                                                  )),
                                              const SizedBox(
                                                width: 7,
                                              ),
                                              const Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text("进入讨论区 >"))
                                            ],
                                          )))
                                ])),
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                              child: Column(children: [
                                Container(
                                    margin: const EdgeInsets.all(10),
                                    child: Container(
                                        child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Row(children: const [
                                                  Icon(Icons.menu),
                                                  Text("官方资讯")
                                                ])),
                                            const Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text("全部>"))
                                          ],
                                        ),
                                        Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                color: Colors.grey[100]),
                                            child: GestureDetector(
                                                onTap: () {},
                                                child: Stack(children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                          gameblocksettings
                                                                          .officiallist
                                                                          .length ==
                                                                      0 ||
                                                                  gameblocksettings ==
                                                                      GameBlockModel
                                                                          .getnull()
                                                              ? "net error"
                                                              : gameblocksettings
                                                                  .officiallist[
                                                                      0]
                                                                  .title,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ))),
                                                  Align(
                                                      widthFactor: 10,
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: Text(
                                                        gameblocksettings
                                                                        .officiallist
                                                                        .length ==
                                                                    0 ||
                                                                gameblocksettings ==
                                                                    GameBlockModel
                                                                        .getnull()
                                                            ? "net error"
                                                            : gameblocksettings
                                                                .officiallist[0]
                                                                .label,
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            backgroundColor:
                                                                Colors.orange),
                                                      )),
                                                  Align(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      child: Text(gameblocksettings
                                                                      .officiallist
                                                                      .length ==
                                                                  0 ||
                                                              gameblocksettings ==
                                                                  GameBlockModel
                                                                      .getnull()
                                                          ? "net error"
                                                          : getMessageTime(
                                                              gameblocksettings
                                                                  .officiallist[
                                                                      0]
                                                                  .date))),
                                                ]))),
                                        Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                color: Colors.grey[100]),
                                            child: GestureDetector(
                                                onTap: () {},
                                                child: Stack(children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                          gameblocksettings
                                                                          .officiallist
                                                                          .length ==
                                                                      0 ||
                                                                  gameblocksettings ==
                                                                      GameBlockModel
                                                                          .getnull()
                                                              ? "net error"
                                                              : gameblocksettings
                                                                  .officiallist[
                                                                      1]
                                                                  .title,
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ))),
                                                  Align(
                                                      widthFactor: 10,
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: Text(
                                                        gameblocksettings
                                                                        .officiallist
                                                                        .length ==
                                                                    0 ||
                                                                gameblocksettings ==
                                                                    GameBlockModel
                                                                        .getnull()
                                                            ? "net error"
                                                            : gameblocksettings
                                                                .officiallist[1]
                                                                .label,
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            backgroundColor:
                                                                Colors.orange),
                                                      )),
                                                  Align(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      child: Text(gameblocksettings
                                                                      .officiallist
                                                                      .length ==
                                                                  0 ||
                                                              gameblocksettings ==
                                                                  GameBlockModel
                                                                      .getnull()
                                                          ? "net error"
                                                          : getMessageTime(
                                                              gameblocksettings
                                                                  .officiallist[
                                                                      1]
                                                                  .date))),
                                                ]))),
                                        Divider(
                                          height: 10.0,
                                          indent: 0.0,
                                          color: Colors.grey,
                                        ),
                                        Row(children: [
                                          Icon(Icons.bookmark_border),
                                          Text("发现")
                                        ]),
                                        Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                color: Colors.grey[100]),
                                            margin: const EdgeInsets.all(10),
                                            child: Column(
                                                children:
                                                    (tipsView(tipslist)))),
                                      ], //gameblocksettings.officiallist
                                    ))),
                                Container(
                                  height: 100,
                                  margin: const EdgeInsets.all(10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Swiper(
                                      key: UniqueKey(),
                                      itemCount: carouselslist.length,
                                      itemBuilder: (context, i) {
                                        return GestureDetector(
                                            child: Image.network(
                                          carouselslist[i].cover,
                                          fit: BoxFit.fitWidth,
                                        ));
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                            ),

                            // GridView.builder(
                            //   shrinkWrap: true,
                            //   physics: BouncingScrollPhysics(),
                            //   gridDelegate:
                            //       SliverGridDelegateWithFixedCrossAxisCount(
                            //           //控制主轴/纵轴之间空隙，列数，宽高比
                            //           mainAxisSpacing: 3.0,
                            //           crossAxisSpacing: 2.0,
                            //           crossAxisCount: 2,
                            //           childAspectRatio: 0.9),
                            //   padding: EdgeInsets.all(5),
                            //   itemCount: tabViews.length,
                            //   itemBuilder: (BuildContext contex, int index) {
                            //     return GestureDetector(
                            //       child:
                            //           CardItemView(carditem: listData[index]),
                            //       onTap: () {
                            //         Navigator.push(
                            //             context,
                            //             new MaterialPageRoute(
                            //                 builder: (contex) =>
                            //                     new VideoPlayPageWithDanmaku(
                            //                         listData[index].aid)));
                            //       },
                            //     );
                            //   },
                            // ),
                          ],
                        ))))));
  }
}

class SampleAppPage extends StatefulWidget {
  const SampleAppPage({Key? key}) : super(key: key);

  @override
  State<SampleAppPage> createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  // Default placeholder text
  String textToShow = 'I Like Flutter';

  void _updateText() {
    setState(() {
      // Update the text
      textToShow = 'Flutter is Awesome!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(textToShow)),
      floatingActionButton: FloatingActionButton(
        heroTag: 'add',
        onPressed: _updateText,
        tooltip: 'Update Text',
        child: const Icon(Icons.update),
      ),
    );
  }
}
