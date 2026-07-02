import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  final List<Map<String, dynamic>> movies;

  const FavoritePage({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    final favoriteMovies = movies
        .where((movie) => movie["favorite"] == true)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favorite Movies",
        ),
      ),

      body: favoriteMovies.isEmpty
          ? const Center(
        child: Text(
          "not ready",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: favoriteMovies.length,
        itemBuilder: (context, index) {
          final movie = favoriteMovies[index];

          return Card(
            margin: const EdgeInsets.only(
              bottom: 12,
            ),
            child: ListTile(
              leading: const Icon(
                Icons.movie,
                size: 35,
              ),

              title: Text(
                movie["title"],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    movie["date"],
                  ),

                  Text(
                    "⭐ ${movie["rating"]}",
                  ),
                ],
              ),

              trailing: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}