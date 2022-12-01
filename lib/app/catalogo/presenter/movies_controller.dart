import 'dart:io';

import 'package:gen/app/catalogo/presenter/states/movies_states.dart';
import 'package:mobx/mobx.dart';

import '../domain/usecases/fetchMovies.dart';

part 'movies_controller.g.dart';

class MovieController = MovieControllerBase with _$MovieController;

abstract class MovieControllerBase with Store {

  final FetchMovies fetchMovies;

  @observable
  MoviesState state = StartState();

  MovieControllerBase({required this.fetchMovies}) {
    initController();
  }

  initController() async {
    await Future.delayed(Duration(seconds: 3));
    setState(await getMovies());
  }

  @action
  setState(MoviesState value) => state = value;

  Future<MoviesState> getMovies() async {
    var result = await fetchMovies.getData();
    return result.fold((l) => ErrorState(l), (r) => SuccessState(r));
  }
}