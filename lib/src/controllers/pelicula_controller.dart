import 'package:get/get.dart';
import 'package:peliculas/src/models/pelicula.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class PeliculaController extends GetxController {
  RxList<Pelicula> _listaPeliculas = List<Pelicula>().obs;
  final _peliculaProvider = PeliculasProvider();
  RxList<Pelicula> get listapeliculas => this._listaPeliculas;

  void cargarPeliculas() async {
    final response = await _peliculaProvider.getPeliculas('3/movie/popular');
    this._listaPeliculas.addAll(response);
  }
}
