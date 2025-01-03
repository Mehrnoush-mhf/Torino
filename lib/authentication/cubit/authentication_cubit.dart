import 'package:bloc/bloc.dart';
import 'package:torino/authentication/repository/authentication_repo.dart';
import 'package:torino/models/user.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  late List<User> users;
  AuthenticationCubit() : super(AuthenticationInitial());

  void init() async {
    users = await AuthenticationRepository.getAllUsers();
  }

  void register(User user) async {
    for (User test in users) {
      if (user.username == test.username) {
        emit(UsernameExistsState());
        return;
      } else if (user.email == test.email) {
        emit(EmailExistsState());
        return;
      }
    }
    AuthenticationRepository.registerUser(user);
    emit(RegisterCompletedState(user: user));
    init();
  }

  Future checkUserLoggedIn() async {
    bool isLoggedIn = await AuthenticationRepository.isUserLoggedIn();
    if (isLoggedIn) {
      User user = await AuthenticationRepository.getLastUser();
      emit(UserLoggedInState(user: user));
    } else {
      emit(UserNotLoggedInState());
    }
  }

  void login(String username, String password) {
    for (User user in users) {
      if (user.username == username && user.password == password) {
        emit(LoginSuccessfulState(user: user));
        return;
      }
    }
    emit(LoginFailedState());
  }
}
