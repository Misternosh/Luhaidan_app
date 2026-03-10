import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const MaterialApp(home: QuranPlayer(), debugShowCheckedModeBanner: false));

class QuranPlayer extends StatelessWidget {
  const QuranPlayer({super.key});

  final List<Map<String, String>> playlist = const [
    {"title": "سورة الحجر", "file": "Surah_al_hejr.mp3"},
    {"title": "سورة الكهف", "file": "Surah_al_kahf.mp3"},
    {"title": "سورة المؤمنون", "file": "Surah_al_mominon.mp3"},
    {"title": "سورة المدثر", "file": "Surah_al_moddathir.mp3"},
    {"title": "سورة لقمان", "file": "Surah_lukman.mp3"},
    {"title": "سورة يوسف", "file": "Surah_yusuf.mp3"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("محمد اللحيدان"), backgroundColor: Colors.green),
      body: ListView.builder(
        itemCount: playlist.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(playlist[index]['title']!),
            trailing: const Icon(Icons.play_arrow),
            onTap: () async {
              final player = AudioPlayer();
              await player.play(AssetSource(playlist[index]['file']!));
            },
          );
        },
      ),
    );
  }
}
