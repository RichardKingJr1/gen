import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gen/app/catalogo/presenter/movies_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args  = settings.arguments;

    switch(settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const FilmesHome());
      default:
        return MaterialPageRoute(builder: (_) => const FilmesHome());
    }
  }
}