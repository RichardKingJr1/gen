import 'package:flutter/material.dart';
import 'package:gen/app/catalogo/domain/entities/movies.dart';
import 'package:gen/app/catalogo/presenter/movies_controller.dart';
import 'package:gen/app/catalogo/presenter/states/movies_states.dart';
import 'package:gen/widgets/movie_item.dart';
import 'package:gen/widgets/texto_titulo.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class FilmesHome extends StatefulWidget {
  const FilmesHome({super.key});

  @override
  State<FilmesHome> createState() => _FilmesHomeState();
}

class _FilmesHomeState extends State<FilmesHome> {

  final controller = GetIt.I.get<MovieController>();

  @override
  Widget build(BuildContext context) {

    return Observer(builder: (_) {
      var state = controller.state;
      if(controller.state is StartState){
        return Scaffold(
          body: Container(
            child: Center(
              child: Image.asset('assets/images/logo.png', height: 50,)
            ),
          ),
        );
      }

      if(controller.state is SuccessState){
        SuccessState state = controller.state as SuccessState;
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Color.fromARGB(0, 0, 0, 0),
            elevation: 0,
            centerTitle: true,
            title:  Padding(
              padding: EdgeInsets.only(top: 5),
              child: Image.asset('assets/images/logo2.png', height: 30,),
            ),
            leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu, size: 35,)),
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Column( 
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  
                  const TextoTitulo("MARVEL"),
                  const TextoTitulo("CINEMATIC"),
                  const TextoTitulo("UNIVERSE"),
                  const SizedBox(height: 30,),
                  const Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      "LINHA DO TEMPO",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 15,
                      )
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.list.length,
                      itemBuilder: (context, i) {
                        Movies item = state.list[i];
                        return Padding( 
                          padding: EdgeInsets.only(left: 15),
                          child: MovieItem(title: item.title ?? '', releaseDate: item.release_date ?? '', posterPath: item.poster_path ?? ''));
                      }
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }


    return Scaffold(
        body: Container(
          child: Center(
            child: Text(
              'ERRO',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Colors.red,
              ),
            ),
          ),
        ),
      );
    });    

  }
}

