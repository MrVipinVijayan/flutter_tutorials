import 'package:flutter_tutorials/utils/exports.dart';

var logger = Logger();

class AudioState extends ChangeNotifier {
  static int _nextMediaId = 0;
  late AudioPlayer player;

  final playlist = ConcatenatingAudioSource(
    children: [
      ClippingAudioSource(
        start: const Duration(seconds: 60),
        end: const Duration(seconds: 90),
        child: AudioSource.uri(
          Uri.parse(
            "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3",
          ),
        ),
        tag: MediaItem(
          id: '${_nextMediaId++}',
          album: "Science Friday",
          title: "A Salute To Head-Scratching Science (30 seconds)",
          artUri: Uri.parse(
            "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
          ),
        ),
      ),
      AudioSource.uri(
        Uri.parse(
          "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3",
        ),
        tag: MediaItem(
          id: '${_nextMediaId++}',
          album: "Science Friday",
          title: "A Salute To Head-Scratching Science",
          artUri: Uri.parse(
            "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
          ),
        ),
      ),
      AudioSource.uri(
        Uri.parse(
          "https://s3.amazonaws.com/scifri-segments/scifri201711241.mp3",
        ),
        tag: MediaItem(
          id: '${_nextMediaId++}',
          album: "Science Friday",
          title: "From Cat Rheology To Operatic Incompetence",
          artUri: Uri.parse(
            "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
          ),
        ),
      ),
      AudioSource.uri(
        Uri.parse("asset:///audio/sample.mp3"),
        tag: MediaItem(
          id: '${_nextMediaId++}',
          album: "Public Domain",
          title: "Nature Sounds",
          artUri: Uri.parse(
            "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
          ),
        ),
      ),
    ],
  );

  AudioState() {
    player = AudioPlayer();
    _init();
  }

  Future<void> _init() async {
    // Listen to errors during playback.
    player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      logger.d('A stream error occurred: $e');
    });
    try {
      await player.setAudioSource(playlist);
    } catch (e, stackTrace) {
      // Catch load errors: 404, invalid url ...
      logger.e("Error loading playlist: $e");
      logger.e(stackTrace);
    }
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }
}
