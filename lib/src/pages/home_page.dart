import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peliculas/src/controllers/pelicula_controller.dart';
import 'package:peliculas/src/models/pelicula.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/widgets/card_poster_pelicula.dart';
import 'package:peliculas/src/widgets/pageview_peliculas.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final peliculasProvider = new PeliculasProvider();
  // final _peliculaController = Get.put<PeliculaController>(PeliculaController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material app'),
      ),
      body: Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          _mostrarPeliculas(),
          _carrusel(context),
        ],
      ),
    );
  }

  Widget _carrusel(context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      child: Column(children: [
        Text('Peliculas Populares'),
        SizedBox(height: 10.0),
        _cargarPopulares(),
      ]),
    );
  }

  Widget _mostrarPeliculas() {
    //se ejecuta la peticion
    return FutureBuilder(
        future: peliculasProvider.getPeliculas('3/movie/now_playing'),
        builder:
            (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
          if (snapshot.hasData) {
            return CardPosterPelicula(
              listaPeliculas: snapshot.data,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _cargarPopulares() {
    return FutureBuilder(
        future: peliculasProvider.getPeliculas('/3/movie/popular'),
        builder:
            (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
          if (snapshot.hasData) {
            return PageViewPeliculas(
              listaPeliculas: snapshot.data,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
// ListTile(
//                   title: Text('${snapshot.data[index].title}'),
//                   subtitle: Text(
//                       '${snapshot.data[index].overview.length > 100 ? snapshot.data[index].overview.substring(0, 100) + '...' : snapshot.data[index].overview}'),
//                 );
