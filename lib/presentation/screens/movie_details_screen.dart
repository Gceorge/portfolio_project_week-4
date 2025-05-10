import 'package:flutter/material.dart';
import '../../logic/movies/models/movies_models.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              movie.posterUrl.isNotEmpty
                  ? movie.posterUrl
                  : 'https://via.placeholder.com/300x450?text=No+Image',
              height: 300,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
              const SizedBox(height: 300, child: Center(child: Icon(Icons.broken_image))),
            ),
            const SizedBox(height: 16),
            Text('${movie.title} (${movie.year})',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Director: ${movie.director}'),
            const SizedBox(height: 4),
            Text('IMDB Rating: ${movie.imdbRating} (${movie.imdbVotes} votes)'),
            const SizedBox(height: 4),
            Text('Genre: ${movie.genre}'),
            const SizedBox(height: 4),
            Text('Runtime: ${movie.runtime}'),
            const SizedBox(height: 4),
            Text('Language: ${movie.language}'),
            const SizedBox(height: 4),
            Text('Country: ${movie.country}'),
            const SizedBox(height: 4),
            if (movie.awards.isNotEmpty) Text('Awards: ${movie.awards}'),
            const SizedBox(height: 16),
            Text('Plot:', style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(movie.plot),
            const SizedBox(height: 8),
            Text('Actors:', style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(movie.actors),
          ],
        ),
      ),
    );
  }
}
