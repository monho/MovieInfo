import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {

  const RoundedImage({super.key, this.assetPath, this.imageUrl});
  final String? assetPath;
  final String? imageUrl;

  @override
  Widget build(final BuildContext context) => ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: imageUrl != null
          ? Image.network(imageUrl!, height: 500, width: double.infinity, fit: BoxFit.cover)
          : Image.asset(assetPath!, height: 500, width: double.infinity, fit: BoxFit.cover),
    );
}


class StudioLogo extends StatelessWidget {
  const StudioLogo({required this.assetPath, super.key});
  final String assetPath;

  @override
  Widget build(final BuildContext context) => Opacity(
      opacity: 0.9,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Image.asset(assetPath),
      ),
    );
}

class InfoBox extends StatelessWidget {

  const InfoBox({required this.title, required this.value, super.key});
  final String title;
  final String value;

  @override
  Widget build(final BuildContext context) => Container(
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
