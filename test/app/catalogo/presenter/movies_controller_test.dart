import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gen/app/catalogo/domain/entities/movies.dart';
import 'package:gen/app/catalogo/domain/erros/errors.dart';
import 'package:gen/app/catalogo/domain/usecases/fetchMovies.dart';
import 'package:gen/app/catalogo/presenter/movies_controller.dart';
import 'package:gen/app/catalogo/presenter/states/movies_states.dart';
import 'package:mocktail/mocktail.dart';

class MockFetchMovies extends Mock implements FetchMovies {}
void main() {
  
  late FetchMovies fetchMovies;
  late MovieController movieController;

  setUp((){
    fetchMovies = MockFetchMovies();
    movieController = MovieController(fetchMovies: fetchMovies);
  });

  test("""
  Quando é feita a solicitação para buscar filmes,
  Deve retornar um estado de sucesso com uma lista de filmes
  """, () async {

    when(() => fetchMovies.getData())
    .thenAnswer((invocation) async => Right(<Movies>[Movies(genre_ids: []), Movies(genre_ids: [])]));

    var result = await movieController.getMovies();

    expect(result, isA<SuccessState>());

    var state = result as SuccessState;
    expect(result.list, isA<List<Movies>>());

  });

   test("""
  Quando é feita a solicitação para buscar filmes,
  Deve retornar um estado de erro
  """, () async {

    when(() => fetchMovies.getData())
    .thenAnswer((invocation) async => Left(ErrorSearch()));

    var result = await movieController.getMovies();

    expect(result, isA<ErrorState>());
  });

}