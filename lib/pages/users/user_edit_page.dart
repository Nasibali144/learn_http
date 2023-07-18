import 'package:flutter/material.dart';
import 'package:learn_http/models/users.dart';

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
        onPressed: () {},
        child: const Icon(Icons.check),
      ),
    );
  }
}
