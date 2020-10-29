import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula.dart';

class PeliculaDetalle extends StatelessWidget {
  const PeliculaDetalle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula = ModalRoute.of(context)
        .settings
        .arguments; //aqui viene la data que pasamos de la otra pantalla

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _crearAppBar(pelicula),
          SliverList(
              delegate: SliverChildListDelegate(
                  [SizedBox(height: 20.0), Text(pelicula.title)]))
        ],
      ),
    );
  }

  Widget _crearAppBar(Pelicula pelicula) {
    return SliverAppBar(
      // collapsedHeight: 150.0, //el minimo que tendra
      expandedHeight: 200.0,
      backgroundColor: Colors.red[900],
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(pelicula.title),
        background: FadeInImage(
            placeholder: AssetImage('assets/imgs/loader.gif'),
            image: NetworkImage(pelicula.getBackdropPath())),
      ),
    );
  }
}
