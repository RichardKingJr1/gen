import 'package:flutter/services.dart';
import 'package:gen/app/utils/packages/client/client_error.dart';
import 'package:gen/app/utils/packages/client/client_response.dart';

class Client {

  //Mock de um cliente para representar uma abstração de um pacote http
  Future<ClientResponse> get(path) async {
    late ClientResponse response;

    var temp = await rootBundle.loadString(path);

    try{
      response = ClientResponse(status: true, data: temp);
    }catch (e){
      response = ClientResponse(status: false, data: null, clientError: ClientError(statusCode: '000' ,data: e));
    }
    
    return response;
  }

  //Outros métodos do client não implementados
  /* Future<ClientResponse> post() async {

  }

  Future<ClientResponse> put() async {
    

  }
  
  Future<ClientResponse> delete() async {

  } */
    
}