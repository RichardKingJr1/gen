import 'package:gen/app/catalogo/data/infra/datasource/moviesDatasource.dart';
import 'package:gen/app/catalogo/data/infra/models/movies_models.dart';
import 'package:gen/app/catalogo/domain/erros/errors.dart';
import 'package:gen/app/catalogo/domain/entities/movies.dart';
import 'package:dartz/dartz.dart';
import 'package:gen/app/catalogo/domain/repositories/moviesRepository.dart';

class MoviesRepositoryImp implements MoviesRepository {
  final MoviesDatasource moviesDatasource;

  MoviesRepositoryImp({required this.moviesDatasource});

  @override
  Future<Either<Failure, List<Movies>>> getMovies() async {
    
    List<MoviesModel>? list = null;

    try{
      list = await moviesDatasource.getMovies();
    }catch (e){
      return left(ErrorSearch());
    }

    return list == null ? left(DatasourceResultNull ()) : right(list);

  }

}