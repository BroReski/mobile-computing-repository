class Movie {
  String title;
  String date;
  String rating;
  bool favorite;

  Movie({
    required this.title,
    required this.date,
    required this.rating,
    this.favorite = false,
  });
}