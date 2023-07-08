import 'package:flutter/material.dart';
import 'package:learn_http/models/movie.dart';
import 'package:learn_http/pages/error_page.dart';
import 'package:learn_http/pages/loading_page.dart';
import 'package:learn_http/services/network_service.dart';

class DetailPage extends StatelessWidget {
  final int id;

  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: Network.methodGet(api: Network.apiMovies, id: id),
      initialData: "No Data",
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none: return const ErrorPage(message: "No Data");
          case ConnectionState.waiting: return const LoadingPage();
          done:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return DetailSuccessPage(data: snapshot.data!);
            } else {
              return const ErrorPage(
                  message:
                      "Something error, Please check your internet connecting!");
            }
          case ConnectionState.active: continue done;
        }
      },
    );
  }
}

class DetailSuccessPage extends StatelessWidget {
  final String data;

  const DetailSuccessPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = Network.parseMovie(data);

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.movie),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Text(
          "$movie",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
