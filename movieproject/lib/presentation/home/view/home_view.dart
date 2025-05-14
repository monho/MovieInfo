import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieproject/presentation/home/viewmodel/home_view_model.dart';
import 'package:movieproject/core/widgets/custom_widgets.dart';
import 'package:movieproject/core/widgets/movie_section.dart';
import 'package:movieproject/presentation/home/viewmodel/home_view_model.dart';
class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('가장 인기있는', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (_) => const DetailView()));
                      },
                      child: const Hero(
                        tag: 'moana',
                        child: RoundedImage(assetPath: 'assets/moana.jpg'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const MovieSection(title: '현재 상영중'),
              const MovieSection(title: '인기순', showRanking: true),
              const MovieSection(title: '평점 높은순'),
              const MovieSection(title: '개봉예정'),
            ],
          ),
        ),
      ),
    );
  }
}
