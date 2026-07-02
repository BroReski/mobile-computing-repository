import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../core/config/api_config.dart';
import '../../data/models/movie.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailPage({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            /// Poster Movie
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),

                child: CachedNetworkImage(
                  imageUrl:
                      "${ApiConfig.imageUrl}${movie.posterPath}",

                  width: 250,
                  height: 350,

                  fit: BoxFit.cover,

                  placeholder: (context, url) =>
                      const SizedBox(
                    width: 250,
                    height: 350,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),

                  errorWidget:
                      (context, url, error) =>
                          Container(
                    width: 250,
                    height: 350,
                    color: Colors.grey.shade300,

                    child: const Icon(
                      Icons.movie,
                      size: 100,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            /// Judul
            Text(
              movie.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            /// Release Date
            const Text(
              "Release Date",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              movie.releaseDate,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 20),

            /// Rating
            Row(
              children: [

                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),

                const SizedBox(width: 8),

                Text(
                  movie.rating.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Spacer(),

                Icon(
                  movie.favorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                  size: 30,
                ),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              "Synopsis",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              movie.overview.isEmpty
                  ? "No synopsis available."
                  : movie.overview,

              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}