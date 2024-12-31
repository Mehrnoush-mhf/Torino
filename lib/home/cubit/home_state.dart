part of 'home_cubit.dart';
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeLogoutState extends HomeActionState {}

final class HomeInitial extends HomeState {}
