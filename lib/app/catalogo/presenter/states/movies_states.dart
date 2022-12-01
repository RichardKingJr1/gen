import 'package:gen/app/catalogo/domain/entities/movies.dart';
import 'package:gen/app/catalogo/domain/erros/errors.dart';

abstract class MoviesState {}

class StartState implements MoviesState {
  const StartState();
}


class ErrorState implements MoviesState {
  final Failure error;
  const ErrorState(this.error);
}

class SuccessState implements MoviesState {
  final List<Movies> list;
  const SuccessState(this.list);
}
