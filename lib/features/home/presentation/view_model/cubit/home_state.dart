part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class TabChanged extends HomeState {}

final class PageViewChanged extends HomeState {}
