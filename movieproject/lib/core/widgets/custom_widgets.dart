import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final String assetPath;
  const RoundedImage({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(assetPath),
    );
  }
}

class StudioLogo extends StatelessWidget {
  final String assetPath;
  const StudioLogo({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Image.asset(assetPath),
      ),
    );
  }
}

class InfoBox extends StatelessWidget {
  final String title;
  final String value;

  const InfoBox({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[800],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 12, color: Colors.white70)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
