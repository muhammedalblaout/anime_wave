import 'package:anime_wave/features/anime/domin/entites/anime_episode.dart';


class AnimeEpisodePage{
  final String currentPage;
  final bool hasNextPage;
  final List<AnimeEpisode>results;

  const AnimeEpisodePage({
    required this.currentPage,
    required this.hasNextPage,
    required this.results,
  });

}