import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String date;
  final String rating;
  final bool favorite;

  final VoidCallback onTap;
  final VoidCallback onFavoritePressed;

  const MovieCard({
    super.key,
    required this.title,
    required this.date,
    required this.rating,
    required this.favorite,
    required this.onTap,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      child: Card(
        elevation: 4,
        margin: const EdgeInsets.only(
          bottom: 16,
        ),

        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(12),
        ),

        child: Padding(
          padding: const EdgeInsets.all(12),

          child: Row(
            children: [
              // Poster Film
              Container(
                width: 100,
                height: 140,

                decoration: BoxDecoration(
                  color: Colors.grey.shade300,

                  borderRadius:
                  BorderRadius.circular(10),
                ),

                child: const Icon(
                  Icons.movie,
                  size: 50,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(width: 16),

              // Informasi Film
              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "Release Date",
                      style: TextStyle(
                        color:
                        Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),

                    Text(
                      date,
                      style:
                      const TextStyle(
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),

                        const SizedBox(width: 5),

                        Text(
                          rating,
                          style:
                          const TextStyle(
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        const Spacer(),

                        IconButton(
                          onPressed:
                          onFavoritePressed,

                          icon: Icon(
                            favorite
                                ? Icons.favorite
                                : Icons.favorite_border,

                            color: Colors.red,
                            size: 28,
                          ),
                        ),
                      ],
                    ),

                    // Status Favorite
                    if (favorite)
                      const Text(
                        "❤️ Added to Wishlist",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight:
                          FontWeight.bold,
                        ),
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