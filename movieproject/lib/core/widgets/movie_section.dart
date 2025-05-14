import 'package:flutter/material.dart';

class MovieSection extends StatelessWidget {
  final String title;
  final bool showRanking;

  const MovieSection({super.key, required this.title, this.showRanking = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/movie_${(index % 5) + 1}.jpg',
                        height: 180,
                        width: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (showRanking)
                      Positioned(
                        left: 8,
                        bottom: 8,
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.black.withOpacity(0.7),
                          child: Text('${index + 1}', style: const TextStyle(fontSize: 12)),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
