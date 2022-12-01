import 'package:gen/app/catalogo/domain/entities/movies.dart';
import 'package:dartz/dartz.dart';
import '../erros/errors.dart';

abstract class MoviesRepository {

  Future<Either<Failure, List<Movies>>> getMovies();

}