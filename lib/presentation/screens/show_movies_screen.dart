import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../logic/movies/models/movies_models.dart';
import 'movie_details_screen.dart';

class ShowMoviesWidget extends StatefulWidget {
  const ShowMoviesWidget({super.key});

  @override
  State<ShowMoviesWidget> createState() => _ShowMoviesWidgetState();
}

class _ShowMoviesWidgetState extends State<ShowMoviesWidget> {
  List<Movie> movies = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  void loadMovies() async {
    final url = Uri.parse('https://670ef2d6-dbdd-454c-b4d7-6960afb18cc2.mock.pstmn.io/movies');
    final response = await http.get(url);

    final List data = json.decode(response.body);
    setState(() {
      movies = data.map((item) => Movie.fromJson(item)).toList();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Movies')),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];

          return ListTile(
            leading: Image.network(
              movie.posterUrl,
              width: 60,
              height: 90,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
              const SizedBox(width: 60, height: 90, child: Icon(Icons.image_not_supported)),
            ),
            title: Text(movie.title),
            subtitle: Text('Directed by ${movie.director}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MovieDetailsScreen(movie: movie),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
