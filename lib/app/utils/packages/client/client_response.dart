import 'package:gen/app/utils/packages/client/client_error.dart';

class ClientResponse {

  bool status;
  dynamic data;
  ClientError? clientError;

  ClientResponse({required this.status, required this.data, this.clientError});

}