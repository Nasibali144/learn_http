import 'package:flutter/material.dart';
import 'package:learn_http/models/harry_potter.dart';
import 'package:learn_http/pages/movie/error_page.dart';
import 'package:learn_http/pages/movie/loading_page.dart';
import 'package:learn_http/services/network_service.dart';

class HarryPotterHome extends StatelessWidget {
  const HarryPotterHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: Network.methodGet(
          baseUrl: Network.baseUrlHarryPotter,
          api: Network.apiHarryAllCharacters),
      initialData: "No Data",
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const ErrorPage(message: "No Data");
          case ConnectionState.waiting:
            return const LoadingPage();
          done:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return HarryPotter(data: snapshot.data!);
            } else {
              return const ErrorPage(
                  message:
                      "Something error, Please check your internet connecting!");
            }
          case ConnectionState.active:
            continue done;
        }
      },
    );
  }
}

class HarryPotter extends StatelessWidget {
  final String data;
  const HarryPotter({Key? key, required this. data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Character> list = Network.parseCharacterList(data);

    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 2 / 3,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          final character = list[index];
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(character.name, style: Theme.of(context).textTheme.titleMedium,),
                if(character.image.isNotEmpty) Expanded(child: Image(image: NetworkImage(character.image))),
              ],
            ),
          );
        },
      ),
    );
  }
}
