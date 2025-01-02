import 'package:bloc/bloc.dart';
import 'package:torino/authentication/repository/authentication_repo.dart';
import 'package:torino/home/repository/home_repo.dart';
import 'package:torino/models/tour.dart';
import 'package:torino/models/user.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  late User user;
  int index = 0;
  HomeCubit() : super(HomeInitial());
  void logout() {
    AuthenticationRepository.logout();
    emit(HomeLogoutState());
  }

  void changeIndex(int index) {
    this.index = index;
    emit(HomeInitial());
  }

  void likeTour(Tour tour) async {
    await HomeRepository.likeTours(user, tour);
    emit(HomeLikeTourState());
  }

  bool isTourLiked(Tour tour) {
    return user.likedTours.contains(tour);
  }

  void closeSearchResults() {
    emit(HomeInitial());
  }

  void searchFavorites(String query) {
    final results = user.likedTours.where((tour) {
      return tour.name.contains(query) || tour.location.contains(query);
    }).toList();
    emit(HomeSearchResultsState(results));
  }
}
