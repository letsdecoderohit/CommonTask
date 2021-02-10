// To parse this JSON data, do
//
//     final createPost = createPostFromJson(jsonString);

import 'dart:convert';

CreatePost createPostFromJson(String str) => CreatePost.fromJson(json.decode(str));

String createPostToJson(CreatePost data) => json.encode(data.toJson());

class CreatePost {
  CreatePost({
    this.status,
    this.data,
    this.message,
  });

  String status;
  Data data;
  String message;

  factory CreatePost.fromJson(Map<String, dynamic> json) => CreatePost(
    status: json["status"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  Data({
    this.name,
    this.salary,
    this.age,
    this.id,
  });

  String name;
  String salary;
  String age;
  int id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    salary: json["salary"],
    age: json["age"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "salary": salary,
    "age": age,
    "id": id,
  };
}
