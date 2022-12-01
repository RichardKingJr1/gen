import 'package:flutter_test/flutter_test.dart';
import 'package:gen/app/catalogo/data/infra/datasource/moviesDatasource.dart';
import 'package:gen/app/catalogo/data/infra/models/movies_models.dart';
import 'package:gen/app/catalogo/data/infra/repositories/moviesRepository.dart';
import 'package:gen/app/catalogo/domain/erros/errors.dart';
import 'package:mocktail/mocktail.dart';

class MoviesDatasourceMock extends Mock implements MoviesDatasource{}
void main() {

  final datasource = MoviesDatasourceMock();
  final repository = MoviesRepositoryImp(moviesDatasource: datasource);

  group('teste do repositorio movies', (){

    test('deve retornar um MoviesModel', () async {

      when(() => datasource.getMovies())
      .thenAnswer((invocation) async => [MoviesModel(genre_ids: [])]);

      var result = await datasource.getMovies();
      expect(result, isA<List<MoviesModel>>());

    });

    test('deve retornar um erroSearch', () async {

      when(() => datasource.getMovies())
      .thenThrow(ErrorSearch());

      var result = await datasource.getMovies();

    });

    test('deve retornar um DatasourceResultNull caso o retorno do datasource seja nulo', () async {
      
      when(() => datasource.getMovies())
      .thenAnswer((invocation) async => []);

      var result = await datasource.getMovies();

    });

  });
  
}