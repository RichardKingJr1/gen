import 'package:gen/app/catalogo/data/infra/models/movies_models.dart';

abstract class MoviesDatasource {
  Future<List<MoviesModel>> getMovies();
}
