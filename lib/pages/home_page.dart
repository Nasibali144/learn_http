import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// api
  final String path = "https://jsonplaceholder.typicode.com/posts";
  String text = 'No Data';

  void getDataFromCloud(String path) async {
    Uri url = Uri.parse(path);
    Response response = await get(url);

    if(response.statusCode == 200) {
      text = response.body;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getDataFromCloud(path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn Networking"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.info_outline_rounded),
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Text(text),
      ),
    );
  }
}
