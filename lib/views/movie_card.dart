import 'package:flutter/material.dart';
import 'package:learn_http/models/movie.dart';
import 'package:learn_http/pages/movie/detail_page.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({Key? key, required this.movie}) : super(key: key);

  void goToDetail(BuildContext context, int id) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailPage(id: id)));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
      child: ListTile(
        leading: Text(movie.id.toString(), style: Theme.of(context).textTheme.headlineSmall,),
        title: Text(movie.movie, style:  Theme.of(context).textTheme.titleLarge,),
        subtitle: Text(movie.imdbUrl, style: Theme.of(context).textTheme.labelMedium),
        trailing: Text(movie.rating.toString(), style: Theme.of(context).textTheme.bodyMedium),
        onTap: () => goToDetail(context, movie.id),
      ),
    );
  }
}