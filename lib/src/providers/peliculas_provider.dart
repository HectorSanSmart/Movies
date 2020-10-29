import 'package:peliculas/src/models/pelicula.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:peliculas/src/utils/constantes.dart';

class PeliculasProvider {
  // Future<List<Pelicula>> obtenerPeliculasPopulares() async {
  //   String _language = 'es-Es';

  //   //luego del host se debe pasar una mapa de datos que recibe la api key
  //   final url = Uri.https(
  //       host, '3/movie/popular', {'api_key': apikey, 'language': _language});

  //   //obtenemos la respuesta de la peticion http
  //   final respuesta = await http.get(url);
  //   //convertimos la respuesta a un objeto json
  //   var jsonResponse = json.decode(respuesta.body);
  //   //convertirlo a una lista de objetos de tipo Pelicula
  //   final listaResultado = ListaPeliculas.fromJsonList(jsonResponse['results']);
  //   return listaResultado.lista;
  // }

  Future<List<Pelicula>> getPeliculas(String endpoint) async {
    //luego del host se debe pasar una mapa de datos que recibe la api key

    final url = Uri.https(host, '$endpoint', {'api_key': apikey});
    final respuesta = await http.get(url);
    //convertimos la respuesta a un objeto json
    var jsonResponse = json.decode(respuesta.body);
    final listaResultado = ListaPeliculas.fromJsonList(jsonResponse['results']);
    return listaResultado.lista;
  }
}
