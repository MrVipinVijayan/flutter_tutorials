import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CarouselController carouselController = CarouselController();

  List<String> images = [
    "https://images.unsplash.com/photo-1503376780353-7e6692767b70",
    "https://images.unsplash.com/photo-1577714141096-bf2b9e69500a",
    "https://images.unsplash.com/photo-1542362567-b07e54358753",
    "https://images.unsplash.com/photo-1511407397940-d57f68e81203",
    "https://images.unsplash.com/photo-1659671026913-b7e632f17395"
  ];

  double itemSize = 330;
  double shrinkSize = 200;
  double prevPosition = 0;
  double totalSize = 0;

  @override
  void initState() {
    super.initState();
    totalSize = itemSize * images.length;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void moveTo(double pos) {
    // carouselController.jumpTo(pos);
    carouselController.animateTo(
      pos,
      duration: const Duration(seconds: 1),
      curve: Curves.easeIn,
    );
    prevPosition = pos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carousel'),
      ),
      body: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 200),
            child: CarouselView(
              controller: carouselController,
              itemExtent: itemSize,
              shrinkExtent: shrinkSize,
              enableSplash: true,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                images.length,
                (index) {
                  return Image.network(
                    images[index],
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (null == loadingProgress) {
                        return child;
                      }
                      final totalBytes =
                          loadingProgress.expectedTotalBytes ?? 1;
                      final loadedBytes = loadingProgress.cumulativeBytesLoaded;
                      final progress = loadedBytes / totalBytes;

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(value: progress),
                          const SizedBox(height: 10),
                          Text('${(progress * 100).toStringAsFixed(0)}%'),
                        ],
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Text('Failed to load image'),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (prevPosition > 0) moveTo(prevPosition - itemSize);
                },
                child: const Text('Prev'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  double nextPos = prevPosition + itemSize;
                  if (nextPos < totalSize) {
                    moveTo(nextPos);
                  }
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
