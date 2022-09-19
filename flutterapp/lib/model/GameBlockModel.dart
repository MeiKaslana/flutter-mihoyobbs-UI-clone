class GameBlockModel {
  List<NavigatorModel> navigatorlist = <NavigatorModel>[];
  DiscussionModel discussion = DiscussionModel.getnull();
  String background = "";
  String backgroundColor = "";
  String officialposition = "";
  List<OfficialModel> officiallist = <OfficialModel>[];
  String carouselsposition = "";
  List<CarouselsModel> carouselslist = <CarouselsModel>[];
  String hot_topicssition = "";
  List<Hot_topicsModel> hot_topicslist = <Hot_topicsModel>[];
  int pagenum = 0;
  GameBlockModel.getnull() {
    List<NavigatorModel> navigatorlist = <NavigatorModel>[];
    DiscussionModel discussion = DiscussionModel.getnull();
    String background = "";
    String backgroundColor = "";
    String officialposition = "";
    List<OfficialModel> officiallist = <OfficialModel>[];
    String carouselsposition = "";
    List<CarouselsModel> carouselslist = <CarouselsModel>[];
    String hot_topicssition = "";
    List<Hot_topicsModel> hot_topicslist = <Hot_topicsModel>[];
    int pagenum = 0;
  }
  GameBlockModel.fromJson(Map<String, dynamic> jsondata) {
    if (jsondata["navigator"] != null) {
      for (var item in jsondata["navigator"]) {
        navigatorlist.add(NavigatorModel.fromJson(item));
      }
      pagenum++;
    }
    if (jsondata["discussion"] != null) {
      discussion = DiscussionModel.fromJson(jsondata["discussion"]);
      pagenum++;
    }
    if (jsondata["background"] != null) {
      if (jsondata["background"]["image"] != null) {
        background = jsondata["background"]["image"].toString();
      }
      if (jsondata["background"]["color"] != null) {
        backgroundColor = jsondata["background"]["color"].toString();
      }
    }
    if (jsondata["official"] != null) {
      if (jsondata["official"]["position"] != null) {
        officialposition = jsondata["official"]["position"].toString();
      }
      if (jsondata["official"]["data"] != null) {
        for (var item in jsondata["official"]["data"]) {
          officiallist.add(OfficialModel.fromJson(item));
        }
      }
      pagenum++;
    }
    if (jsondata["carousels"] != null) {
      if (jsondata["carousels"]["position"] != null) {
        carouselsposition = jsondata["carousels"]["position"].toString();
      }
      if (jsondata["carousels"]["data"] != null) {
        for (var item in jsondata["carousels"]["data"]) {
          carouselslist.add(CarouselsModel.fromJson(item));
        }
      }
      pagenum++;
    }
    if (jsondata["hot_topics"] != null) {
      if (jsondata["hot_topics"]["position"] != null) {
        hot_topicssition = jsondata["hot_topics"]["position"].toString();
      }
      if (jsondata["hot_topics"]["data"] != null) {
        for (var item in jsondata["hot_topics"]["data"]) {
          hot_topicslist.add(Hot_topicsModel.fromJson(item));
        }
      }
      pagenum++;
    }
  }
}

class NavigatorModel {
  String id = "";
  String name = "";
  String icon = "";
  String app_path = "";
  String reddot_online_time = "";
  NavigatorModel.getnull() {
    String id = "";
    String name = "";
    String icon = "";
    String app_path = "";
    String reddot_online_time = "";
  }
  NavigatorModel.fromJson(Map<String, dynamic> jsondata) {
    if (jsondata["id"] != null) {
      id = jsondata["id"].toString();
    }
    if (jsondata["name"] != null) {
      name = jsondata["name"].toString();
    }
    if (jsondata["icon"] != null) {
      icon = jsondata["icon"].toString();
    }
    if (jsondata["app_path"] != null) {
      app_path = jsondata["app_path"].toString();
    }
    if (jsondata["reddot_online_time"] != null) {
      reddot_online_time = jsondata["reddot_online_time"].toString();
    }
  }
}

class DiscussionModel {
  String icon = "";
  String title = "";
  String prompt = "";
  DiscussionModel.getnull() {
    String icon = "";
    String title = "";
    String prompt = "";
  }
  DiscussionModel.fromJson(Map<String, dynamic> jsondata) {
    if (jsondata["icon"] != null) {
      icon = jsondata["icon"].toString();
    }
    if (jsondata["title"] != null) {
      title = jsondata["title"].toString();
    }
    if (jsondata["prompt"] != null) {
      prompt = jsondata["prompt"].toString();
    }
  }
}

class OfficialModel {
  String post_id = "";
  String title = "";
  String date = "";
  String label = "";
  String is_top = "";
  OfficialModel.getnull() {
    String post_id = "";
    String title = "";
    String date = "";
    String label = "";
    String is_top = "";
  }
  OfficialModel.fromJson(Map<String, dynamic> jsondata) {
    if (jsondata["post_id"] != null) {
      post_id = jsondata["post_id"].toString();
    }
    if (jsondata["title"] != null) {
      title = jsondata["title"].toString();
    }
    if (jsondata["date"] != null) {
      date = jsondata["date"].toString();
    }
    if (jsondata["label"] != null) {
      label = jsondata["label"].toString();
    }
    if (jsondata["is_top"] != null) {
      is_top = jsondata["is_top"].toString();
    }
  }
}

class CarouselsModel {
  String cover = "";
  String app_path = "";
  CarouselsModel.fromJson(Map<String, dynamic> jsondata) {
    if (jsondata["cover"] != null) {
      cover = jsondata["cover"].toString();
    }
    if (jsondata["app_path"] != null) {
      app_path = jsondata["app_path"].toString();
    }
  }
}

class Hot_topicsModel {
  String topic_id = "";
  String image = "";
  String topic_name = "";
  String post_name = "";
  String view = "";
  String discuss = "";
  Hot_topicsModel.fromJson(Map<String, dynamic> jsondata) {
    if (jsondata["topic_id"] != null) {
      topic_id = jsondata["topic_id"].toString();
    }
    if (jsondata["image"] != null) {
      image = jsondata["image"].toString();
    }
    if (jsondata["topic_name"] != null) {
      topic_name = jsondata["topic_name"].toString();
    }
    if (jsondata["post_name"] != null) {
      post_name = jsondata["post_name"].toString();
    }
    if (jsondata["count"]["view"] != null) {
      view = jsondata["count"]["view"].toString();
    }
    if (jsondata["count"]["discuss"] != null) {
      view = jsondata["count"]["discuss"].toString();
    }
  }
}
