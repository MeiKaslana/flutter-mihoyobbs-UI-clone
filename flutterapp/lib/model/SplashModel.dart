class SplashItem {
  String id = "";
  String splash_image = "";
  String app_path = "";
  String show_time = "";
  String freq_type = "";
  String game_id = "";
  SplashItem.fromJson(Map<String, dynamic> jsondata) {
    if (jsondata["id"] != null) {
      id = jsondata["id"].toString();
    }
    if (jsondata["splash_image"] != null) {
      splash_image = jsondata["splash_image"].toString();
    }
    if (jsondata["app_path"] != null) {
      app_path = jsondata["app_path"].toString();
    }
    if (jsondata["show_time"] != null) {
      app_path = jsondata["show_time"].toString();
    }
    if (jsondata["freq_type"] != null) {
      app_path = jsondata["freq_type"].toString();
    }
    if (jsondata["game_id"] != null) {
      app_path = jsondata["game_id"].toString();
    }
  }
}
