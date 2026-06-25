import 'package:flutter/material.dart';

class MovieDetailPage extends StatefulWidget {
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
  State<MovieDetailPage> createState() =>
      _MovieDetailPageState();
}

class _MovieDetailPageState
    extends State<MovieDetailPage> {

  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.favorite;
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    widget.onFavoriteToggle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),

        actions: [
          IconButton(
            onPressed: toggleFavorite,
            icon: Icon(
              isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.red,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [
            Center(
              child: Container(
                width: 220,
                height: 320,

                decoration: BoxDecoration(
                  color: Colors.grey.shade300,

                  borderRadius:
                  BorderRadius.circular(16),
                ),

                child: const Icon(
                  Icons.movie,
                  size: 100,
                ),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Icon(
                  isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                  size: 30,
                ),

                const SizedBox(width: 10),

                Text(
                  isFavorite
                      ? "Favorited"
                      : "Add To Favorite",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight:
                    FontWeight.w500,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Text(
              "Release Date",
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),

            Text(
              widget.date,
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
                  widget.rating,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              "Synopsis",
              style: TextStyle(
                fontSize: 22,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              "${widget.title} adalah salah satu film populer yang memiliki banyak penggemar di seluruh dunia. Film ini mendapatkan rating tinggi dan menjadi salah satu tontonan favorit bagi banyak orang.",
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