import 'dart:convert';

UserModel userModelJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String userName;
  String userNickName;
  String userEmail;
  String userPassword;

  UserModel({required this.userName, required this.userNickName, required this.userEmail, required this.userPassword});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      userName: json["userName"],
      userNickName: json["userNickName"],
      userEmail: json["userEmail"],
      userPassword: json["password"]);

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "userNickName": userNickName,
        "userEmail": userEmail,
        "password": userPassword,
      };

  String get username => userName;

  String get usernickname => userNickName;

  String get useremail => userEmail;

  String get userpassword => userPassword;
}
