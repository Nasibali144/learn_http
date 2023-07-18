import 'package:flutter/material.dart';
import 'package:learn_http/services/network_service.dart';
import '../../models/users.dart';

class UserDetailPage extends StatefulWidget {
  final User? user;
  const UserDetailPage({Key? key, this.user}) : super(key: key);

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  late final TextEditingController controllerUsername;
  late final TextEditingController controllerEmail;
  late final TextEditingController controllerImageUrl;
  late final TextEditingController controllerPassword;
  Status status = Status.read;

  void pressFAB() {
    if(status == Status.read) {
      setState(() => status = Status.edit);
    } else {
      sendDataToServer();
    }
  }

  void sendDataToServer() async {
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

    final user = User(createdAt: DateTime.now().millisecondsSinceEpoch, name: username, imageUrl: imageUrl, email: email, password: password, id: "00");

    final data = user.toJson();
    if(status == Status.create) {
      await createUser(data);
    } else if(status == Status.edit) {
      await editUser(data);
    }

    if(mounted) {
      Navigator.pop(context, "Done");
    }
  }

  Future<void> editUser(Map<String, Object?> data) async {
    await Network.methodPut(
      api: Network.users,
      id: widget.user!.id,
      baseUrl: Network.baseUrlUsers,
      data: data,
    );
  }

  Future<void> createUser(Map<String, Object?> data) async {
    await Network.methodPost(
      api: Network.users,
      baseUrl: Network.baseUrlUsers,
      data: data,
    );
  }


  void getOldUser() {
    if(widget.user == null) {
      status = Status.create;
    }
    controllerUsername = TextEditingController(text: widget.user?.name);
    controllerEmail = TextEditingController(text: widget.user?.email);
    controllerImageUrl = TextEditingController(text: widget.user?.imageUrl);
    controllerPassword = TextEditingController(text: widget.user?.password);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getOldUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${status.name.substring(0,1).toUpperCase() + status.name.substring(1)} User")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
                controller: controllerUsername,
                decoration: const InputDecoration(labelText: "Username"),
            readOnly: status == Status.read,),
            TextField(
                controller: controllerEmail,
                decoration: const InputDecoration(labelText: "Email"),
            readOnly: status == Status.read,),
            TextField(
                controller: controllerImageUrl,
                decoration: const InputDecoration(labelText: "ImageUrl"),
            readOnly: status == Status.read,),
            TextField(
                controller: controllerPassword,
                decoration: const InputDecoration(labelText: "Password"),
            readOnly: status == Status.read,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pressFAB,
        child: Icon(status == Status.read ? Icons.edit : Icons.check),
      ),
    );
  }
}

enum Status {
  read,
  create,
  edit
}
