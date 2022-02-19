// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.uid,
        this.email,
        this.name,
        this.about,
        this.age,
        this.gender,
        this.height,
        this.role,
        this.status,
        this.photoUrl,
        this.rating,
        this.patients,
        this.experience,
        this.weight,
        this.lastSignInTime,
        this.creationTime,
        this.updatedTime,
        this.chats,
        this.keyName,
    });

    String? uid;
    String? email;
    String? name;
    String? about;
    int? age;
    String? gender;
    String? keyName;
    int? height;
    String? role;
    String? status;
    String? photoUrl;
    int? rating;
    int? patients;
    int? experience;
    int? weight;
    String? lastSignInTime;
    String? creationTime;
    String? updatedTime;
    List<ChatUsers>? chats;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json["uid"],
        email: json["email"],
        name: json["name"],
        about: json["about"],
        age: json["age"],
        gender: json["gender"],
        height: json["height"],
        role: json["role"],
        status: json["status"],
        photoUrl: json["photoUrl"],
        rating: json["rating"],
        patients: json["patients"],
        experience: json["experience"],
        weight: json["weight"],
        keyName : json['keyName'],
        lastSignInTime: json["lastSignInTime"],
        creationTime: json["creationTime"],
        updatedTime: json["updatedTime"],
        chats: List<ChatUsers>.from(json["chats"].map((x) => ChatUsers.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "name": name,
        "about": about,
        "age": age,
        "gender": gender,
        "height": height,
        "role": role,
        "status": status,
        "photoUrl": photoUrl,
        "rating": rating,
        "patients": patients,
        "experience": experience,
        "weight": weight,
        "lastSignInTime": lastSignInTime,
        "creationTime": creationTime,
        "updatedTime": updatedTime,
        'keyName' : keyName,
        "chats": List<dynamic>.from(chats!.map((x) => x.toJson())),
    };
}

class ChatUsers {
    ChatUsers({
        this.connection,
        this.chatId,
        this.lastTime,
        this.totalUnread,
    });

    String? connection;
    String? chatId;
    String? lastTime;
    int? totalUnread;

    factory ChatUsers.fromJson(Map<String, dynamic> json) => ChatUsers(
        connection: json["connection"],
        chatId: json["chat_id"],
        lastTime: json["lastTime"],
        totalUnread: json["total_unread"],
    );

    Map<String, dynamic> toJson() => {
        "connection": connection,
        "chat_id": chatId,
        "lastTime": lastTime,
        "total_unread": totalUnread,
    };
}
