import 'dart:convert';

import 'dart:convert';

import 'package:get/get.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {

  String? emailUsu;
  String? passUsu;
  String? nomUsu;
  String? telUsu;
  String? dirUsu;
  String? cedUsu;
  String? image;
  String? token;

  User({
    this.emailUsu,
    this.passUsu,
    this.nomUsu,
    this.telUsu,
    this.dirUsu,
    this.cedUsu,
    this.image,
    this.token
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    emailUsu: json["emailUsu"],
    passUsu: json["passUsu"],
    nomUsu: json["nomUsu"],
    telUsu: json["telUsu"],
    dirUsu: json["dirUsu"],
    cedUsu: json["cedUsu"],
    image: json["image"],
    token: json['token']
  );

  Map<String, dynamic> toJson() => {
    "emailUsu": emailUsu,
    "passUsu": passUsu,
    "nomUsu": nomUsu,
    "telUsu": telUsu,
    "dirUsu": dirUsu,
    "cedUsu": cedUsu,
    "image": image,
    "token": token
  };
}

/*
User uSerFromJson(String str) => User.fromJson(json.decode(str));

String uSerToJson(User data) => json.encode(data.toJson());

class User {

  String? email_Usu;
  String? nomUsu;
  String? telUsu;
  String? dirUsu;
  String? token;
  String? image;

  User({
    this.email_Usu,
    this.nomUsu,
    this.telUsu,
    this.dirUsu,
    this.token,
    this.image
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    email_Usu: json["email_Usu"],
    nomUsu: json["nomUsu"],
    telUsu: json["telUsu"],
    dirUsu: json["dirUsu"],
    token: json["token"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "email_Usu": email_Usu,
    "nomUsu": nomUsu,
    "telUsu": telUsu,
    "dirUsu": dirUsu,
    "token": token,
    "image": image,
  };
}
*/


/*

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {

  int? id_Usu;
  //String? email;
  //String? name;
  //String? lastname;
  //String? phone;
  //String? image;
  String? pass_Usu;
  String ? email_Usu;
  String? token;

  User({
    this.id_Usu,
    this.email_Usu,
    this.pass_Usu,
    //this.lastname,
    //this.phone,
    //this.image,
    this.token
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id_Usu: json["id_Usu"],
    email_Usu: json["email_Usu"],
    //name: json["name"],
    //lastname: json["lastname"],
    //phone: json["phone"],
    //image: json["image"],
    pass_Usu: json["pass_Usu"],
    token: json["token"]
  );

  Map<String, dynamic> toJson() => {
    "id_Usu": id_Usu,
    "email_Usu": email_Usu,
    //"name": name,
    //"lastname": lastname,
    //"phone": phone,
    //"image": image,
    "pass_Usu": pass_Usu,
    "token": token
  };
}
*/