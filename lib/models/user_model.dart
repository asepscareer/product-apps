class UserModel {
  final String createdAt;
  final String name;
  final String avatar;
  final String id;

  UserModel({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      createdAt: json['createdAt'],
      name: json['name'],
      avatar: json['avatar'],
      id: json['id'],
    );
  }

  static List<UserModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => UserModel.fromJson(json)).toList();
  }
}
