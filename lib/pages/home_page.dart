import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/movie_service.dart';
import 'detail_page.dart';
import '../utils/notifications.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieService _movieService = MovieService();
  late List<Movie> _movies;

  @override
  void initState() {
    super.initState();
    _movies = _movieService.getMovies();
  }

  Future<void> _navigateToDetail(Movie movie) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(movie: movie),
      ),
    );
    _refreshFavorites();
  }

  void _refreshFavorites() {
    setState(() {
      // Refresh data to update favorite status
      _movies = _movieService.getMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Film'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: _movies.length,
        itemBuilder: (context, index) {
          final movie = _movies[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Hero(
                tag: 'poster-${movie.id}',
                child: Image.network(
                  movie.posterUrl,
                  width: 50,
                  height: 75,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 50,
                      height: 75,
                      color: Colors.grey[300],
                      child: const Icon(Icons.movie, color: Colors.grey),
                    );
                  },
                ),
              ),
              title: Text(
                movie.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text('Tahun: ${movie.year}'),
              trailing: IconButton(
                icon: Icon(
                  movie.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: movie.isFavorite ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _movieService.toggleFavorite(movie.id);
                    // Optimistically update local list reference
                    _movies = _movieService.getMovies();
                  });
                  final updated = _movieService.getMovieById(movie.id);
                  if (updated != null) {
                    showFavoriteSnackBar(context, isNowFavorite: updated.isFavorite);
                  }
                },
              ),
              onTap: () async {
                await _navigateToDetail(movie);
              },
            ),
          );
        },
      ),
    );
  }
}