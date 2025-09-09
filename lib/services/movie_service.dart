import '../models/movie.dart';

class MovieService {
  static final MovieService _instance = MovieService._internal();
  
  factory MovieService() {
    return _instance;
  }
  
  MovieService._internal();
  
  final List<Movie> _movies = [
    Movie(
      id: '1',
      title: 'The Shawshank Redemption',
      year: 1994,
      posterUrl: 'https://images.unsplash.com/photo-1489599102910-59206b8ca314?w=400&h=600&fit=crop',
      genres: ['Drama', 'Crime'],
      synopsis: 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.',
    ),
    Movie(
      id: '2',
      title: 'The Godfather',
      year: 1972,
      posterUrl: 'https://images.unsplash.com/photo-1489599102910-59206b8ca314?w=400&h=600&fit=crop',
      genres: ['Crime', 'Drama'],
      synopsis: 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.',
    ),
    Movie(
      id: '3',
      title: 'The Dark Knight',
      year: 2008,
      posterUrl: 'https://images.unsplash.com/photo-1489599102910-59206b8ca314?w=400&h=600&fit=crop',
      genres: ['Action', 'Crime', 'Drama'],
      synopsis: 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
    ),
    Movie(
      id: '4',
      title: 'Pulp Fiction',
      year: 1994,
      posterUrl: 'https://images.unsplash.com/photo-1489599102910-59206b8ca314?w=400&h=600&fit=crop',
      genres: ['Crime', 'Drama'],
      synopsis: 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.',
    ),
    Movie(
      id: '5',
      title: 'Inception',
      year: 2010,
      posterUrl: 'https://images.unsplash.com/photo-1489599102910-59206b8ca314?w=400&h=600&fit=crop',
      genres: ['Action', 'Adventure', 'Sci-Fi'],
      synopsis: 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.',
    ),
  ];

  final List<Movie> _favorites = [];

  List<Movie> getMovies() {
    return _movies;
  }

  List<Movie> getFavorites() {
    return _favorites;
  }

  void toggleFavorite(String movieId) {
    final movieIndex = _movies.indexWhere((movie) => movie.id == movieId);
    if (movieIndex != -1) {
      _movies[movieIndex].isFavorite = !_movies[movieIndex].isFavorite;
      
      final favoriteIndex = _favorites.indexWhere((movie) => movie.id == movieId);
      
      if (_movies[movieIndex].isFavorite) {
        if (favoriteIndex == -1) {
          _favorites.add(_movies[movieIndex]);
        }
      } else {
        if (favoriteIndex != -1) {
          _favorites.removeAt(favoriteIndex);
        }
      }
    }
  }

  Movie? getMovieById(String id) {
    try {
      return _movies.firstWhere((movie) => movie.id == id);
    } catch (e) {
      return null;
    }
  }
}