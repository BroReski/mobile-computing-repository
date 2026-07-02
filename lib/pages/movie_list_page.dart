import 'package:flutter/material.dart';
import '../widget/movie_card.dart';
import 'movie_detail_page.dart';
import 'favorite_page.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final List<Map<String, dynamic>> movies = [
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
    {
      "title": "The Dark Knight",
      "date": "18 Juli 2008",
      "rating": "9.0 / 10",
      "favorite": false,
    },
    {
      "title": "Inception",
      "date": "16 Juli 2014",
      "rating": "8.8 / 10",
      "favorite": false,
    },
    {
      "title": "Spider-Man: No Way Home",
      "date": "17 Desember 2021",
      "rating": "8.2 / 10",
      "favorite": false,
    },
    {
      "title": "Big Hero 6",
      "date": "11 Desember 2025",
      "rating": "8.9 / 10",
      "favorite": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Catalog"),

        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FavoritePage(
                    movies: movies,
                  ),
                ),
              );
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [
            const Text(
              "🎬 Movie Catalog",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Daftar Film Populer",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: movies.length,

                itemBuilder: (context, index) {
                  return MovieCard(
                    title: movies[index]["title"],
                    date: movies[index]["date"],
                    rating: movies[index]["rating"],
                    favorite:
                    movies[index]["favorite"],

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              MovieDetailPage(
                                title:
                                movies[index]["title"],

                                date:
                                movies[index]["date"],

                                rating:
                                movies[index]["rating"],

                                favorite:
                                movies[index]["favorite"],

                                onFavoriteToggle: () {
                                  setState(() {
                                    movies[index]
                                    ["favorite"] =
                                    !movies[index]
                                    ["favorite"];
                                  });
                                },
                              ),
                        ),
                      ).then((_) {
                        setState(() {});
                      });
                    },

                    onFavoritePressed: () {
                      setState(() {
                        movies[index]["favorite"] =
                        !movies[index]
                        ["favorite"];
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}