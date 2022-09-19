class TipsPost {
  String game_id = "";
  String post_id = "";
  String f_forum_id = "";
  String uid = "";
  String subject = "";
  String content = "";
  String cover = "";
  String view_type = "";
  String created_at = "";
  List images = [];
  String is_followed = "";
  String nickname = "";
  String avatar_url = "";
  String view_num = "";
  String reply_num = "";
  String like_num = "";
  String forum = "";

  TipsPost.fromJson(Map<String, dynamic> jsondata) {
    if (jsondata["post"]["game_id"] != null) {
      game_id = jsondata["game_id"].toString();
    }
    if (jsondata["post"]["post_id"] != null) {
      post_id = jsondata["post"]["post_id"].toString();
    }
    if (jsondata["post"]["f_forum_id"] != null) {
      f_forum_id = jsondata["post"]["f_forum_id"].toString();
    }
    if (jsondata["post"]["uid"] != null) {
      uid = jsondata["post"]["uid"].toString();
    }
    if (jsondata["post"]["subject"] != null) {
      subject = jsondata["post"]["subject"].toString();
    }
    if (jsondata["post"]["content"] != null) {
      content = jsondata["post"]["content"].toString();
    }
    if (jsondata["post"]["cover"] != null) {
      cover = jsondata["post"]["cover"].toString();
    }
    if (jsondata["post"]["view_type"] != null) {
      view_type = jsondata["post"]["view_type"].toString();
    }
    if (jsondata["post"]["created_at"] != null) {
      created_at = jsondata["post"]["created_at"].toString();
    }
    if (jsondata["post"]["images"] != null) {
      images = jsondata["post"]["images"];
    }
    if (jsondata["user"]["is_followed"] != null) {
      is_followed = jsondata["user"]["is_followed"].toString();
    }
    if (jsondata["user"]["nickname"] != null) {
      nickname = jsondata["user"]["nickname"].toString();
    }
    if (jsondata["user"]["avatar_url"] != null) {
      avatar_url = jsondata["user"]["avatar_url"].toString();
    }
    if (jsondata["stat"]["view_num"] != null) {
      view_num = jsondata["stat"]["view_num"].toString();
    }
    if (jsondata["stat"]["reply_num"] != null) {
      reply_num = jsondata["stat"]["reply_num"].toString();
    }
    if (jsondata["stat"]["like_num"] != null) {
      like_num = jsondata["stat"]["like_num"].toString();
    }
    if (jsondata["forum"]["name"] != null) {
      forum = jsondata["forum"]["name"].toString();
    }
  }

  TipsPost.getnull() {
    String game_id = "";
    String post_id = "";
    String f_forum_id = "";
    String uid = "";
    String subject = "";
    String content = "";
    String cover = "";
    String view_type = "";
    String created_at = "";
    String images = "";
    String is_followed = "";
    String nickname = "";
    String avatar_url = "";
    String view_num = "";
    String reply_num = "";
    String like_num = "";
    String forum = "";
  }
}
