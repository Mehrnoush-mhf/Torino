import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:torino/authentication/repository/authentication_repo.dart';
import 'package:torino/models/user.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  User user;
  HomeCubit({required this.user}) : super(HomeInitial());
  void logout() {
    AuthenticationRepository.logout();
    emit(HomeLogoutState());
  }
}
