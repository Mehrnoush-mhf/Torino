part of 'home_cubit.dart';

abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeLogoutState extends HomeActionState {}

class HomeLikeTourState extends HomeActionState {}

class HomeSearchResultsState extends HomeState {
  final List<Tour> results;
  HomeSearchResultsState(this.results);
}

final class HomeInitial extends HomeState {}
