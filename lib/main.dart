import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const LuhaidanApp());

class LuhaidanApp extends StatelessWidget {
  const LuhaidanApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuranPlayer(),
    );
  }
}

class QuranPlayer extends StatefulWidget {
  @override
  _QuranPlayerState createState() => _QuranPlayerState();
}

class _QuranPlayerState extends State<QuranPlayer> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final List<Map<String, String>> playlist = [
    {"title": "سورة الحجر", "file": "Surah_al_hejr.mp3"},
    {"title": "سورة الكهف", "file": "Surah_al_kahf.mp3"},
    {"title": "سورة المؤمنون", "file": "Surah_al_mominon.mp3"},
    {"title": "سورة المدثر", "file": "Surah_al_moddathir.mp3"},
    {"title": "سورة لقمان", "file": "Surah_lukman.mp3"},
    {"title": "سورة يوسف", "file": "Surah_yusuf.mp3"},
  ];

  void playAudio(String fileName) async {
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource('audio/$fileName'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("القارئ محمد اللحيدان"), backgroundColor: Colors.green),
      body: ListView.builder(
        itemCount: playlist.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(playlist[index]['title']!),
            trailing: const Icon(Icons.play_arrow),
            onTap: () => playAudio(playlist[index]['file']!),
          );
        },
      ),
    );
  }
}
