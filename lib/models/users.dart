final jsonMy = {
  "createdAt": 1680754862414,
  "name": "sdfw",
  "imageUrl": "",
  "email": "wefweqf",
  "password": "wefwe",
  "id": "8"
};

class User {
  int createdAt;
  String name;
  String imageUrl;
  String email;
  String password;
  String id;

  User({
    required this.createdAt,
    required this.name,
    required this.imageUrl,
    required this.email,
    required this.password,
    required this.id,
  });

  factory User.fromJson(Map<String, Object?> json) => User(
        createdAt: int.tryParse(json['createdAt'].toString()) ?? 0,
        name: json['name'] as String,
        imageUrl: json['imageUrl'] as String,
        email: json['email'] as String,
        password: json['password'] as String,
        id: json['id'] as String,
      );
}
