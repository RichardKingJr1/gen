import 'package:flutter/material.dart';
import 'package:gen/app/catalogo/data/external/moviesDatasourceImp.dart';
import 'package:gen/app/catalogo/data/infra/repositories/moviesRepository.dart';
import 'package:gen/app/catalogo/domain/usecases/fetchMovies.dart';
import 'package:gen/app/catalogo/presenter/movies_controller.dart';
import 'package:gen/app/utils/packages/client/client.dart';
import 'package:get_it/get_it.dart';

import 'app/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt getIt = GetIt.I;
  getIt.registerSingleton(MovieController(fetchMovies: FetchMoviesImp(moviesRepository: MoviesRepositoryImp(moviesDatasource: MoviesDatasourceImp(client: Client())))));

  runApp(const MyApp());
    //runApp(MyApp());
}

