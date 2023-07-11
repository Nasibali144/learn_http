import 'package:flutter/material.dart';
import 'package:learn_http/models/movie.dart';
import 'package:learn_http/services/network_service.dart';
import 'package:learn_http/views/movie_card.dart';

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
          return MovieCard(movie: items[index]);
        },
      ),
    );
  }
}
