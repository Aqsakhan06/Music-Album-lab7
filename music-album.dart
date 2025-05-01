import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() {
  timeDilation = 2.0;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Album Gallery',
      debugShowCheckedModeBanner: false,
      home: const AlbumGalleryPage(),
    );
  }
}

class Album {
  final String id;
  final String title;
  final String artist;
  final String coverImage;
  final List<String> tracks;

  Album({
    required this.id,
    required this.title,
    required this.artist,
    required this.coverImage,
    required this.tracks,
  });
}

final List<Album> albums = [
  Album(
    id: 'a1',
    title: 'Caffeine & Heartbeats',
    artist: 'Taylor Swift',
    coverImage: 'assets/Taylor-Swift.webp',
    tracks: [
      'All Too Well',
      'Enchanted',
      'Wildest Dreams',
      'Back to December',
      'Invisible String',
    ],
  ),
  Album(
    id: 'a2',
    title: 'Oops... I Did It Again (But Better)',
    artist: 'Justin Bieber',
    coverImage: 'assets/Justin-Bieber.jpg',
    tracks: ['Peaches', 'Sorry', 'Intentions', 'What Do You Mean?', 'Lonely'],
  ),
  Album(
    id: 'a3',
    title: 'Messy Hair & Daydreams',
    artist: 'Sabrina Carpenter',
    coverImage: 'assets/Sabrina-carpenter.jpeg',
    tracks: [
      'Skin',
      'On My Way',
      'Why',
      'Can’t Blame a Girl for Trying',
      'Almost Love',
    ],
  ),
  Album(
    id: 'a4',
    title: 'Pineapple Pizza & Chaos',
    artist: 'BLACKPINK',
    coverImage: 'assets/Black-pink.jpg',
    tracks: [
      'How You Like That',
      'Kill This Love',
      'DDU-DU DDU-DU',
      'Lovesick Girls',
      'Pretty Savage',
    ],
  ),
];

class AlbumGalleryPage extends StatelessWidget {
  const AlbumGalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Music Albums')),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: albums.length,
        itemBuilder: (context, index) {
          final album = albums[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AlbumDetailPage(album: album),
                ),
              );
            },
            child: Hero(
              tag: album.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(album.coverImage, fit: BoxFit.cover),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AlbumDetailPage extends StatelessWidget {
  final Album album;
  const AlbumDetailPage({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(album.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Hero(
              tag: album.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  album.coverImage,
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              album.artist,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Track List',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            ...album.tracks.map(
              (track) => ListTile(
                leading: const Icon(Icons.music_note),
                title: Text(track),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
