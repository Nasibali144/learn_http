import 'package:flutter/material.dart';
import 'package:learn_http/models/users.dart';
import 'package:learn_http/services/network_service.dart';

class UserEditPage extends StatefulWidget {
  final User user;
  const UserEditPage({Key? key, required this.user}) : super(key: key);

  @override
  State<UserEditPage> createState() => _UserEditPageState();
}

class _UserEditPageState extends State<UserEditPage> {
  late final TextEditingController controllerUsername;
  late final TextEditingController controllerEmail;
  late final TextEditingController controllerImageUrl;
  late final TextEditingController controllerPassword;

  @override
  void initState() {
    super.initState();
    getOldUser();
  }

   void getOldUser() {
     controllerUsername = TextEditingController(text: widget.user.name);
     controllerEmail = TextEditingController(text: widget.user.email);
     controllerImageUrl = TextEditingController(text: widget.user.imageUrl);
     controllerPassword = TextEditingController(text: widget.user.password);
     setState(() {});
   }

  void editUser() async {
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

    await Network.methodPut(
      api: Network.users,
      id: widget.user.id,
      baseUrl: Network.baseUrlUsers,
      data: data,
    );

    Navigator.pop(context, "Hammasi Joyda");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit User")),
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
        onPressed: editUser,
        child: const Icon(Icons.check),
      ),
    );
  }
}
