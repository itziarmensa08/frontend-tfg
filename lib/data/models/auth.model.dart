class Auth {
  static bool isAdmin = false;
  static String? id;
  static String? token;
  static String? language;

  static Map<String, dynamic> toJson() {
    return {
      'isAdmin': isAdmin,
      'id': id,
      'token': token,
      'language': language,
    };
  }

  static void fromJson(Map<String, dynamic> json) {
    isAdmin = json['isAdmin'];
    id = json['id'];
    token = json['token'];
    language = json['language'];
  }

}