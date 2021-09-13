import 'package:flutter/material.dart';
import 'package:flutter_provider_pattern/src/model/movie.dart';
import 'package:flutter_provider_pattern/src/repository/movie_repository.dart';

class MovieProvider extends ChangeNotifier {
  MovieRepository _movieRepository = MovieRepository();
  List<Movie> _movies = [];
  List<Movie> get movies => _movies;

  loadMovies() async {
    List<Movie> listMovies = await _movieRepository.loadMovies();
    _movies = listMovies;
    notifyListeners();
  }
}