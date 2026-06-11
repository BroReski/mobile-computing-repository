import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Catalog',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: const MyHomePage(
        title: 'Movie Catalog',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Array/List Data Film
  final List<Map<String, dynamic>> movies = [
    {
      "title": "Avengers: Endgame",
      "date": "26 April 2019",
      "rating": "8.4 / 10",
      "favorite": false,
    },
    {
      "title": "Interstellar2",
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
      "date": "16 Juli 2010",
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

  Widget movieCard(
  BuildContext context,
  int index,
  String title,
  String date,
  String rating,
  bool favorite,
) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetailPage(
            title: title,
            date: date,
            rating: rating,
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
            Container(
              width: 100,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.movie,
                size: 50,
                color: Colors.black54,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
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
                    date,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
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
                        rating,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  return movieCard(
                  context,
                  index,
                  movies[index]["title"],
                  movies[index]["date"],
                  movies[index]["rating"],
                  movies[index]["favorite"],
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

class MovieDetailPage extends StatelessWidget {
  final String title;
  final String date;
  final String rating;

  const MovieDetailPage({
    super.key,
    required this.title,
    required this.date,
    required this.rating,
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