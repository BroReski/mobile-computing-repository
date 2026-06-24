import 'package:flutter/material.dart';

class MovieDetailPage extends StatelessWidget {
  final String title;
  final String date;
  final String rating;

  final bool favorite;
  final VoidCallback onFavoriteToggle;

  const MovieDetailPage({
    super.key,
    required this.title,
    required this.date,
    required this.rating,
    required this.favorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 220,
                height: 320,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.movie,
                  size: 100,
                ),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                IconButton(
                  onPressed: () {
                    onFavoriteToggle();
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    favorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                    size: 32,
                  ),
                ),

                Text(
                  favorite
                      ? "Favorited"
                      : "Add to Favorite",
                ),
              ],
            ),

            const SizedBox(height: 16),

            Text(
              "Release Date",
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),

            Text(
              date,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                const SizedBox(width: 8),
                Text(
                  rating,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              "Synopsis",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              "$title adalah salah satu film populer yang memiliki banyak penggemar di seluruh dunia. Film ini mendapatkan rating tinggi dan menjadi salah satu tontonan favorit bagi banyak orang.",
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}