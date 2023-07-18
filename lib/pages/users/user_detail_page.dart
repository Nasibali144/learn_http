import 'package:flutter/material.dart';
import 'package:learn_http/services/network_service.dart';

class UserDetailPage extends StatefulWidget {
  const UserDetailPage({Key? key}) : super(key: key);

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  final controllerUsername = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerImageUrl = TextEditingController();
  final controllerPassword = TextEditingController();

  void createUser() async {
    String username = controllerUsername.value.text.trim();
    String email = controllerEmail.value.text.trim();
    String imageUrl = controllerImageUrl.value.text.trim();
    String password = controllerPassword.value.text.trim();

    if (username.isEmpty ||
        email.isEmpty ||
        imageUrl.isEmpty ||
        password.isEmpty) {
      return;
    }

    final data = {
      "name": username,
      "imageUrl": imageUrl,
      "email": email,
      "password": password,
    };

    await Network.methodPost(
      api: Network.users,
      baseUrl: Network.baseUrlUsers,
      data: data,
    );

    Navigator.pop(context, "Hammasi Joyda");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create User")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
                controller: controllerUsername,
                decoration: const InputDecoration(labelText: "Username")),
            TextField(
                controller: controllerEmail,
                decoration: const InputDecoration(labelText: "Email")),
            TextField(
                controller: controllerImageUrl,
                decoration: const InputDecoration(labelText: "ImageUrl")),
            TextField(
                controller: controllerPassword,
                decoration: const InputDecoration(labelText: "Password")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createUser,
        child: const Icon(Icons.check),
      ),
    );
  }
}
