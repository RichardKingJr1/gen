import 'package:dartz/dartz.dart';
import 'package:gen/app/catalogo/domain/entities/movies.dart';
import 'package:gen/app/catalogo/domain/erros/errors.dart';
import 'package:gen/app/catalogo/domain/repositories/moviesRepository.dart';

abstract class FetchMovies {
  Future<Either<Failure, List<Movies>>> getData();
}

class FetchMoviesImp extends FetchMovies {
  final MoviesRepository moviesRepository;

  FetchMoviesImp({required this.moviesRepository});

  @override
  Future<Either<Failure, List<Movies>>> getData() async {
    var response = await moviesRepository.getMovies();
    return response.fold((l) => left(l), (r) => r.isEmpty ? left(EmptyList()) : right(r));
  }

}