import 'package:flutter_tutorials/utils/exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final audioState = context.watch<AudioState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Background Audio Player'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: StreamBuilder<SequenceState?>(
                stream: audioState.player.sequenceStateStream,
                builder: (context, snapshot) {
                  final state = snapshot.data;
                  if (state?.sequence.isEmpty ?? true) {
                    return const SizedBox.shrink();
                  }
                  final metadata = state!.currentSource!.tag as MediaItem;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Image.network(metadata.artUri.toString()),
                          ),
                        ),
                      ),
                      Text(
                        metadata.album!,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(metadata.title),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 8.0),
            ControlButtons(audioState.player),
            const SizedBox(height: 8.0),
            SizedBox(
              height: 200,
              child: StreamBuilder<SequenceState?>(
                stream: audioState.player.sequenceStateStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final state = snapshot.data;
                    final sequence = state?.sequence ?? [];
                    return ListView.builder(
                      itemCount: sequence.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          selected: index == state?.currentIndex,
                          title: Text(sequence[index].tag.title as String),
                          onTap: () async {
                            audioState.player.seek(Duration.zero, index: index);
                          },
                        );
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
