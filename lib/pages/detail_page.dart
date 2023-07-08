import 'package:flutter/material.dart';
import 'package:learn_http/models/movie.dart';
import 'package:learn_http/services/network_service.dart';

class DetailPage extends StatefulWidget {
  final int id;
  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Movie? movie;

  @override
  void initState() {
    super.initState();
    fetchMovie(widget.id);
  }

  void fetchMovie(int id) async {
    final data = await Network.methodGet(api: Network.apiMovies, id: id);
    movie = Network.parseMovie(data!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return movie != null ? Scaffold(
      appBar: AppBar(
        title: Text(movie!.movie),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
      ),
    ) : const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
