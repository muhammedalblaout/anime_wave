part of 'episode_servers_cubit.dart';

@immutable
sealed class EpisodeServersState {}

final class EpisodeServersInitial extends EpisodeServersState {}
final class EpisodeServersloading extends EpisodeServersState {}
final class EpisodeServersSuccess extends EpisodeServersState {
  final WatchEpisode watchEpisode;

   EpisodeServersSuccess({
    required this.watchEpisode,
  });
}
final class EpisodeServersFaill extends EpisodeServersState {
  final String massage;

   EpisodeServersFaill({
    required this.massage,
  });
}


