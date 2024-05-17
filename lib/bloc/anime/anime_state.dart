part of 'anime_bloc.dart';

@immutable
sealed class AnimeState {}

final class AnimeInitial extends AnimeState {}
final class Animeblocloading extends AnimeState {}
final class Animeblocloaded extends AnimeState {}
final class Animeblocerror extends AnimeState {}