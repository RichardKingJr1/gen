class ClientError {
  
  String statusCode;
  dynamic data;

  String get messageError => _messageError();

  ClientError({this.statusCode = "", this.data});

  String _messageError() {
    return "ClientError: $data";
  }
}