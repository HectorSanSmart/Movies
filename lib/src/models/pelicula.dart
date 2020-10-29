class ListaPeliculas {
  List<Pelicula> lista = new List();
  ListaPeliculas();
  ListaPeliculas.fromJsonList(List<dynamic> lista) {
    if (lista == null) return;
    for (var item in lista) {
      this.lista.add(Pelicula.fromJson(item));
    }
  }
}

class Pelicula {
  String title;
  String overview;
  String releaseDate;
  String posterPath;
  String backdropPath;
  dynamic id;
  dynamic voteAverage;
  String originalLanguage;

  //en este constructor se inicializan los valores
  Pelicula({
    this.title,
    this.overview,
    this.releaseDate,
    this.backdropPath,
    this.posterPath,
    this.id,
    this.originalLanguage,
    this.voteAverage,
  });

  //retornar la intancia de la clase desde el constructor con nombre
  //retorna un objeto de la clase pelicula
  factory Pelicula.fromJson(Map<String, dynamic> json) {
    return Pelicula(
      posterPath: json["poster_path"],
      id: json["id"],
      backdropPath: json["backdrop_path"],
      originalLanguage: json["original_language"],
      title: json["title"],
      voteAverage: json["vote_average"],
      overview: json["overview"],
      releaseDate: json["release_date"],
    );
  }

  String getPoster() {
    if (posterPath != null)
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    else
      return 'https://www.colombianosune.com/sites/default/files/asociaciones/NO_disponible-43_5.jpg';
  }

  String getBackdropPath() {
    if (backdropPath != null)
      return 'https://image.tmdb.org/t/p/w500/$backdropPath';
    else
      return 'https://www.colombianosune.com/sites/default/files/asociaciones/NO_disponible-43_5.jpg';
  }
}
