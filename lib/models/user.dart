class User {
  // Initialize data types
  String id;
  String username;
  String password;
  String image;
  String createdAt;
  String updatedAt;

  // Add Constructor each data types
  User({
    required this.id,
    required this.username,
    required this.password,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  // Creates a Comment object from a JSON map
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        image: json["image"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  // Converts object properties to a JSON-compatible Map for serialization.
  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "image": image,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
