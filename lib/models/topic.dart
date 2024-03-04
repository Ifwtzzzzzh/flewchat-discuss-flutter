import 'package:discuss_app_v3/models/user.dart';

class Topic {
  // Initialize data types
  String id;
  String title;
  String description;
  String images;
  String idUser;
  String createdAt;
  String updatedAt;
  User? user;

  // Add Constructor each data types
  Topic({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.idUser,
    required this.createdAt,
    required this.updatedAt,
    this.user,
  });

  // Creates a Comment object from a JSON map
  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        images: json["images"],
        idUser: json["id_user"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  // Converts object properties to a JSON-compatible Map for serialization.
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "images": images,
        "id_user": idUser,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
