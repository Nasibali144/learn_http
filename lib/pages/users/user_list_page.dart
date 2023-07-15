import 'package:flutter/material.dart';
import 'package:learn_http/models/users.dart';
import 'package:learn_http/services/network_service.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<User> users = [];

  void getAllUser() async {
    final response = await Network.methodGet(api: Network.users, baseUrl: Network.baseUrlUsers);
    users = Network.parseUserList(response!);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAllUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Users"),),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: users.length,
        itemBuilder: (context, i) {
          final user = users[i];
          return Card(
            child: ListTile(
              title: Text(user.name),
              subtitle: Text(user.email),
              leading: CircleAvatar(
                child: Center(
                  child: Text(user.id),
                ),
              ),
              trailing: IconButton(onPressed: () {
                debugPrint("Deleted: ${user.name}");
              }, icon: const Icon(Icons.delete)),
            ),
          );
        },
      ),
    );
  }
}
