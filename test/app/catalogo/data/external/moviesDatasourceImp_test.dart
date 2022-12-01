import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:gen/app/catalogo/data/external/moviesDatasourceImp.dart';
import 'package:gen/app/catalogo/data/infra/models/movies_models.dart';
import 'package:gen/app/utils/packages/client/client.dart';
import 'package:gen/app/utils/packages/client/client_response.dart';
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements Client {}

main() {

  TestWidgetsFlutterBinding.ensureInitialized();
  var client =  MockClient();
  var datasource = MoviesDatasourceImp(client: client);

  group('Teste Datasource movies', (){
    test('Deve retornar uma lista de MoviesModel', () async {

      when(() => client.get(any()))
      .thenAnswer((invocation) async => ClientResponse(status: true, data: json.encode(data)));


      var result = await datasource.getMovies();
      expect(result, isA<List<MoviesModel>>());
    });

  });

}

const data = {
  "mcu": [
      {
          "adult": false,
          "backdrop_path": "/yFuKvT4Vm3sKHdFY4eG6I4ldAnn.jpg",
          "genre_ids": [
              28,
              12,
              878
          ],
          "id": 1771,
          "original_language": "en",
          "original_title": "Captain America: The First Avenger",
          "overview": "Steve Rogers é um jovem que participa de experiências visando a criação do supersoldado americano. Quando os oficiais militares conseguem transformá-lo em uma arma humana, eles percebem que não podem arriscar a vida do jovem nas batalhas de guerra.",
          "popularity": 44.224,
          "poster_path": "/xYijVAPunk6neVW2KHKE4Lp45ZU.jpg",
          "release_date": "2011-07-22",
          "title": "Capitão América: O Primeiro Vingador",
          "video": false,
          "vote_average": 7.0,
          "vote_count": 16878
      }
  ]
};