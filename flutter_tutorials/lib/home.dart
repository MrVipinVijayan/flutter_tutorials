import 'package:flutter/material.dart';

List<String> images = [
  "https://images.unsplash.com/photo-1503376780353-7e6692767b70",
  "https://images.unsplash.com/photo-1577714141096-bf2b9e69500a",
  "https://images.unsplash.com/photo-1542362567-b07e54358753",
  "https://images.unsplash.com/photo-1511407397940-d57f68e81203",
  "https://images.unsplash.com/photo-1659671026913-b7e632f17395"
];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CarouselView',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 200),
        child: CarouselView(
          itemExtent: 330,
          shrinkExtent: 200,
          controller: carouselController,
          enableSplash: true,
          scrollDirection: Axis.horizontal,
          itemSnapping: true,
          onTap: (value) {
            debugPrint("Tapped index: $value");
          },
          elevation: 5.0,
          padding: const EdgeInsets.all(10.0),
          children: List.generate(
            images.length,
            (index) => Image.network(
              images[index],
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                // Calculate progress percentage
                final totalBytes = loadingProgress.expectedTotalBytes ?? 1;
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
                return const Center(child: Text('Failed to load image'));
              },
            ),
          ),
        ),
      ),
    );
  }
}
