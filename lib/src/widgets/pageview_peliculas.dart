import 'package:flutter/material.dart';

import 'package:peliculas/src/models/pelicula.dart';

class PageViewPeliculas extends StatelessWidget {
  PageViewPeliculas({Key key, @required this.listaPeliculas}) : super(key: key);
  final List<Pelicula> listaPeliculas;
  final _listaController =
      PageController(initialPage: 1, viewportFraction: 0.3);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: double.infinity,
        child: PageView(
          controller: _listaController,
          children: _cargarItem(context),
        ));
  }

  List<Widget> _cargarItem(context) {
    return listaPeliculas.map((pelicula) {
      //el map recibe como argumento un objeto, en este caso se llama pelicula pero puede ser llamado de cualquier forma
      //el map itera sobre esa lista todos los datos que vengan en el resultado de la peticion
      return GestureDetector(
        //detecta los gestos en la pantalla
        onTap: () {
          Navigator.of(context)
              .pushNamed('peliculadetalle', arguments: pelicula);
          print(pelicula.title);
        },

        child: Column(
          children: [
            ClipRRect(
              //recorta la imagen en un circulo
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                placeholder: AssetImage(
                    'assets/imgs/loader.gif'), //mientras carga la imagen
                image: NetworkImage(pelicula.getPoster()),
                fit: BoxFit.cover,
                height: 150.0,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(pelicula.title, overflow: TextOverflow.ellipsis),
          ],
        ),
      );
    }).toList();
  }
}
