import 'package:flutter/material.dart';
import 'package:learn_http/models/users.dart';
import 'package:learn_http/pages/users/user_edit_page.dart';
import 'package:learn_http/services/network_service.dart';
import 'package:learn_http/pages/users/user_detail_page.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<User> users = [];
  bool isLoading = false;

  void getAllUser() async {
    setState(() => isLoading = true);
    final response = await Network.methodGet(api: Network.users, baseUrl: Network.baseUrlUsers);
    users = Network.parseUserList(response!);
    setState(() => isLoading = false);
  }

  void userDelete(String id) async {
    setState(() => isLoading = true);
    await Network.methodDelete(api: Network.users, baseUrl: Network.baseUrlUsers, id: id);
    getAllUser();
  }

  void createUser() async {
    setState(() => isLoading = true);
    final msg = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UserDetailPage()));
    setState(() => isLoading = false);
    if(msg == "Hammasi Joyda") {
      getAllUser();
    }
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
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: users.length,
            itemBuilder: (context, i) {
              final user = users[i];
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UserEditPage(user: user)));
                  },
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  leading: CircleAvatar(
                    child: Center(
                      child: Text(user.id.toString()),
                    ),
                  ),
                  trailing: IconButton(onPressed: () {
                    userDelete(user.id);
                  }, icon: const Icon(Icons.delete)),
                ),
              );
            },
          ),

          if(isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createUser,
        child: const Icon(Icons.add),
      ),
    );
  }
}
