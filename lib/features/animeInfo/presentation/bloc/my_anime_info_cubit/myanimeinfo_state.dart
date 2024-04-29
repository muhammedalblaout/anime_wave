part of 'myanimeinfo_cubit.dart';

@immutable
sealed class MyanimeinfoState {}

final class MyanimeinfoInitial extends MyanimeinfoState {}
final class MyanimeinfoSuccess extends MyanimeinfoState {
  MyAnimeInfo myAnimeInfo;

  MyanimeinfoSuccess(this.myAnimeInfo);
}


final class MyanimeinfoLoading extends MyanimeinfoState {}
final class MyanimeinfoFail extends MyanimeinfoState {
  String massage;

  MyanimeinfoFail(this.massage);
}

final class MyanimeinfoEmpty extends MyanimeinfoState {
  bool isEmpty;

  MyanimeinfoEmpty(this.isEmpty);
}
