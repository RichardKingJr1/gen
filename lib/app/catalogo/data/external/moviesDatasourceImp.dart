import 'dart:convert';
import 'package:gen/app/catalogo/data/infra/datasource/moviesDatasource.dart';
import 'package:gen/app/catalogo/data/infra/models/movies_models.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:gen/app/utils/packages/client/client.dart';
import 'package:gen/app/utils/packages/client/client_response.dart';

class MoviesDatasourceImp implements MoviesDatasource {

  Client client;

  MoviesDatasourceImp({required this.client});

  @override
  Future<List<MoviesModel>> getMovies() async {

    ClientResponse response = await client.get('assets/json/mock.json');

    if(response.status){
      Map<String,dynamic> jsonData = json.decode(response.data);
      var jsonList = jsonData['mcu'] as List;
      return  jsonList.map((item) => MoviesModel.fromMap(item)).toList();
    }else{
      throw Error;
    }
    
  }
}