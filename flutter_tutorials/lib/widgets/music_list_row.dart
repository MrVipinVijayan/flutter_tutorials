import 'package:flutter_tutorials/utils/exports.dart';

class MusicListRow extends StatelessWidget {
  const MusicListRow(
    this.mediaItem, {
    super.key,
  });

  final MediaItem mediaItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Image.network(mediaItem.artUri.toString()),
            ),
          ),
        ),
        Text(
          mediaItem.album!,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(mediaItem.title),
      ],
    );
  }
}
