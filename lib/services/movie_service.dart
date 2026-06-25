class MovieService {
  Future<List<Map<String, dynamic>>> getMovies() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    return [
      {
        "title": "Avengers: Endgame",
        "date": "26 April 2019",
        "rating": "8.4 / 10",
        "favorite": false,
      },
      {
        "title": "Interstellar",
        "date": "7 November 2014",
        "rating": "8.7 / 10",
        "favorite": false,
      },
    ];
  }
}