import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gen/widgets/texto_filme.dart';

class MovieItem extends StatelessWidget {
  final String title;
  final String releaseDate;
  final String posterPath;

  const MovieItem({super.key, required this.title, required this.releaseDate, required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                "https://image.tmdb.org/t/p/original/"+posterPath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10,),
          TextoFilme(title, size: 15, padding: 0,),
          SizedBox(height: 2,),
          TextoFilme("(${releaseDate.substring(0,4)})", size: 12, padding: 0,),
        ],
      ),
      
    );
  }
}