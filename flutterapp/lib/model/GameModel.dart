class GameItem {
  String id = "";
  String name = "";
  String en_name = "";
  String app_icon = "";
  String icon = "";
  String search_trend_word = "";
  String level_image = "";
  String level_text_color = "";
  String topic_num = "";
  String op_name = "";
  String main_color = "";
  String has_wiki = "";
  GameItem.fromJson(Map<String, dynamic> jsondata) {
    if (jsondata["id"] != null) {
      id = jsondata["id"].toString();
    }
    if (jsondata["name"] != null) {
      name = jsondata["name"].toString();
    }
    if (jsondata["en_name"] != null) {
      en_name = jsondata["en_name"].toString();
    }
    if (jsondata["app_icon"] != null) {
      app_icon = jsondata["app_icon"].toString();
    }
    if (jsondata["icon"] != null) {
      icon = jsondata["icon"].toString();
    }
    if (jsondata["search_trend_word"] != null) {
      search_trend_word = jsondata["search_trend_word"].toString();
    }
    if (jsondata["level_image"] != null) {
      level_image = jsondata["level_image"].toString();
    }
    if (jsondata["topic_num"] != null) {
      topic_num = jsondata["topic_num"].toString();
    }
    if (jsondata["op_name"] != null) {
      op_name = jsondata["op_name"].toString();
    }
    if (jsondata["main_color"] != null) {
      main_color = jsondata["main_color"].toString();
    }
    if (jsondata["has_wiki"] != null) {
      has_wiki = jsondata["has_wiki"].toString();
    }
  }

  GameItem.getnull() {
    String id = "";
    String name = "";
    String en_name = "";
    String app_icon = "";
    String icon = "";
    String search_trend_word = "";
    String level_image = "";
    String level_text_color = "";
    String topic_num = "";
    String op_name = "";
    String main_color = "";
    String has_wiki = "";
  }
}
