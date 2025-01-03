part of 'authentication_cubit.dart';

abstract class AuthenticationState {}

abstract class AuthenticationActionState extends AuthenticationState {}

class UsernameExistsState extends AuthenticationState {}

class EmailExistsState extends AuthenticationState {}

class RegisterCompletedState extends AuthenticationActionState {
  User user;
  RegisterCompletedState({required this.user});
}

class LoginSuccessfulState extends AuthenticationActionState {
  User user;
  LoginSuccessfulState({required this.user});
}

class LoginFailedState extends AuthenticationActionState {}

class UserLoggedInState extends AuthenticationActionState {
  User user;
  UserLoggedInState({required this.user});
}

class UserNotLoggedInState extends AuthenticationActionState {}

final class AuthenticationInitial extends AuthenticationState {}
