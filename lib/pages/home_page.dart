import 'package:flutter/material.dart';
import 'package:learn_http/models/movie.dart';
import 'package:learn_http/services/network_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> items = [];

  void fetchMovies() async {
    final data = await Network.methodGet(api: Network.apiMovies);
    items = Network.parseMovieList(data!);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Movies"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final movie = items[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
            child: ListTile(
              leading: Text(movie.id.toString(), style: Theme.of(context).textTheme.headlineSmall,),
              title: Text(movie.movie, style:  Theme.of(context).textTheme.titleLarge,),
              subtitle: Text(movie.imdbUrl, style: Theme.of(context).textTheme.labelMedium),
              trailing: Text(movie.rating.toString(), style: Theme.of(context).textTheme.bodyMedium),
            ),
          );
        },
      ),
    );
  }
}
