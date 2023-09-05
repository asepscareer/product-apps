class UserInfo {
  int id;
  String username;
  String email;
  List<String> roles;
  String token;

  UserInfo({
    required this.id,
    required this.username,
    required this.email,
    required this.roles,
    required this.token,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    List<String> rolesList = List<String>.from(json["roles"] ?? []);

    return UserInfo(
      id: json["id"],
      username: json["username"],
      email: json["email"],
      roles: rolesList,
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "roles": roles,
      };
}
