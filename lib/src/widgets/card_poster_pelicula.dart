import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula.dart';

class CardPosterPelicula extends StatelessWidget {
  final List<Pelicula> listaPeliculas;
  //con required se hace obligatoria una propiedad dentro del constructor
  CardPosterPelicula({Key key, @required this.listaPeliculas})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //con mediquery obtenemos la info del dispositivo
    final sizeTelefono = MediaQuery.of(context).size;

    return Container(
      //   padding: EdgeInsets.only(top: 10.0, left: 15.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      // width: sizeTelefono.width * 0.8,
      // height: sizeTelefono.height * 0.5,
      child: Swiper(
        itemWidth: sizeTelefono.width * 0.8,
        itemHeight: sizeTelefono.height * 0.5,
        itemBuilder: (BuildContext context, int index) {
          //    return Text('${listaPeliculas[index].title}');
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: AssetImage(
                  'assets/imgs/loader.gif'), //mientras carga la imagen
              image: NetworkImage(listaPeliculas[index].getPoster()),
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: listaPeliculas.length,
        layout: SwiperLayout.STACK,
        // pagination:
        //     new SwiperPagination(), //indica cuantas imagenes son, en paginacion
        // control: new SwiperControl(), //indica que puedo deslizar a los lados
      ),
    );
  }
}
