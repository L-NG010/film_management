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
      title: 'The Chronicles of Narnia: The Lion, the Witch and the Wardrobe',
      year: 2005,
      posterUrl: 'https://images.unsplash.com/photo-1489599102910-59206b8ca314?w=400&h=600&fit=crop',
      genres: ['Fantasy', 'Adventure', 'Family'],
      synopsis: 'Four siblings enter the magical world of Narnia through a wardrobe and join Aslan to defeat the White Witch.',
    ),
    Movie(
      id: '2',
      title: 'The Hobbit: An Unexpected Journey',
      year: 2012,
      posterUrl: 'https://images.unsplash.com/photo-1489599102910-59206b8ca314?w=400&h=600&fit=crop',
      genres: ['Fantasy', 'Adventure'],
      synopsis: 'Bilbo Baggins joins a company of dwarves and Gandalf on a quest to reclaim Erebor from the dragon Smaug.',
    ),
    Movie(
      id: '3',
      title: 'Komang',
      year: 2025,
      posterUrl: 'https://images.unsplash.com/photo-1489599102910-59206b8ca314?w=400&h=600&fit=crop',
      genres: ['Drama', 'Romance'],
      synopsis: 'Sebuah kisah drama Indonesia tentang perjalanan cinta dan pilihan hidup.',
    ),
    Movie(
      id: '4',
      title: 'Jumbo',
      year: 2008,
      posterUrl: 'https://images.unsplash.com/photo-1489599102910-59206b8ca314?w=400&h=600&fit=crop',
      genres: ['Animation', 'Adventure', 'Family'],
      synopsis: 'Seekor gajah kecil bernama Jumbo mencari ayahnya dan menemukan keberanian di medan perang.',
    ),
    Movie(
      id: '5',
      title: 'Pee Mak',
      year: 2013,
      posterUrl: 'https://images.unsplash.com/photo-1489599102910-59206b8ca314?w=400&h=600&fit=crop',
      genres: ['Comedy', 'Horror', 'Romance'],
      synopsis: 'Mak kembali dari perang, namun desas-desus mengatakan istrinya, Nak, adalah hantu. Sahabat-sahabatnya berusaha mengungkap kebenaran.',
    ),
    Movie(
      id: '6',
      title: 'My Stupid Boss',
      year: 2016,
      posterUrl: 'https://images.unsplash.com/photo-1489599102910-59206b8ca314?w=400&h=600&fit=crop',
      genres: ['Comedy'],
      synopsis: 'Kisah karyawan yang harus berhadapan dengan bosnya yang eksentrik dan penuh kelucuan di kantor.',
    ),
    Movie(
      id: '7',
      title: 'How to Train Your Dragon',
      year: 2010,
      posterUrl: 'https://images.unsplash.com/photo-1489599102910-59206b8ca314?w=400&h=600&fit=crop',
      genres: ['Animation', 'Adventure', 'Family', 'Fantasy'],
      synopsis: 'Seorang Viking muda bernama Hiccup berteman dengan seekor naga bernama Toothless, menantang tradisi pemburuan naga di desanya.',
    ),
  ];

  final List<Movie> _favorites = [];

  List<Movie> getMovies() {
    return _movies;
  }

  List<Movie> getFavorites() {
    return _favorites;
  }

  bool toggleFavorite(String movieId) {
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
      return _movies[movieIndex].isFavorite;
    }
    return false;
  }

  Movie? getMovieById(String id) {
    try {
      return _movies.firstWhere((movie) => movie.id == id);
    } catch (e) {
      return null;
    }
  }
}