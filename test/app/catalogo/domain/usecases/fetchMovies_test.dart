import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gen/app/catalogo/domain/entities/movies.dart';
import 'package:gen/app/catalogo/domain/erros/errors.dart';
import 'package:gen/app/catalogo/domain/repositories/moviesRepository.dart';
import 'package:gen/app/catalogo/domain/usecases/fetchMovies.dart';
import 'package:mocktail/mocktail.dart';


class MoviesRepositoryMock extends Mock implements MoviesRepository { }

main() {

  late final moviesRepository = MoviesRepositoryMock();
  late final usecase  = FetchMoviesImp(moviesRepository: moviesRepository);

  group('Testes do getMovies', (){
    test('Deve retornar a lista de filmes', () async {

      when(() => moviesRepository.getMovies())
          .thenAnswer((_) async => right(<Movies>[Movies(genre_ids: []), Movies(genre_ids: [])]));    

      var result = await usecase.getData();
      expect(result.fold(id, id), isA<List<Movies>>());
    });

    test('Deve retornar a lista vazia', () async {

      when(() => moviesRepository.getMovies())
          .thenAnswer((_) async => right(<Movies>[]));    

      var result = await usecase.getData();
      expect(result.fold(id, id), isA<EmptyList>());
    });

    test('Deve retornar erro', () async {

      when(() => moviesRepository.getMovies())
          .thenAnswer((_) async => left(Failure()));    

      var result = await usecase.getData();
      expect(result.fold(id, id), isA<Failure>());
    });
  });

  
}