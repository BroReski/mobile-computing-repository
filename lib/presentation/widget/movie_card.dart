import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../core/config/api_config.dart';
import '../../data/models/movie.dart';
import '../pages/movie_detail_page.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MovieDetailPage(
              movie: movie,
            ),
          ),
        );
      },

      child: Card(
        elevation: 4,
        margin: const EdgeInsets.only(bottom: 16),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),

        child: Padding(
          padding: const EdgeInsets.all(12),

          child: Row(
            children: [

              /// Poster Movie
              ClipRRect(
                borderRadius: BorderRadius.circular(10),

                child: CachedNetworkImage(
                  imageUrl:
                      "${ApiConfig.imageUrl}${movie.posterPath}",

                  width: 100,

                  height: 140,

                  fit: BoxFit.cover,

                  placeholder: (context, url) =>
                      Container(
                    width: 100,
                    height: 140,
                    alignment: Alignment.center,
                    child:
                        const CircularProgressIndicator(),
                  ),

                  errorWidget:
                      (context, url, error) =>
                          Container(
                    width: 100,
                    height: 140,
                    color: Colors.grey.shade300,

                    child: const Icon(
                      Icons.movie,
                      size: 50,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Text(
                      movie.title,

                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "Release Date",

                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),

                    Text(
                      movie.releaseDate,
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: [

                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),

                        const SizedBox(width: 5),

                        Text(
                          movie.rating.toString(),
                        ),

                        const Spacer(),

                        Icon(
                          movie.favorite
                              ? Icons.favorite
                              : Icons.favorite_border,

                          color: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}