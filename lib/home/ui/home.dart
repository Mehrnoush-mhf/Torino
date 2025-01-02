import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torino/constants/colors.dart';
import 'package:torino/home/cubit/home_cubit.dart';
import 'package:torino/home/ui/favorites_page.dart';
import 'package:torino/home/ui/home_page.dart';
import 'package:torino/home/ui/profile_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatelessWidget {
  final CarouselSliderController buttonCarouselController =
      CarouselSliderController();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeLogoutState) {
          Navigator.of(context).pushReplacementNamed('splash');
        }
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: Directionality(
            textDirection: TextDirection.rtl,
            child: GNav(
              selectedIndex: BlocProvider.of<HomeCubit>(context).index,
              haptic: true,
              tabBorderRadius: 15,
              curve: Curves.easeOutExpo,
              gap: 8,
              tabMargin: const EdgeInsets.all(8.0),
              color: Colors.grey[800],
              activeColor: AppTheme.primaryColor,
              iconSize: 24,
              tabBackgroundColor: AppTheme.primaryColor.withValues(alpha: 0.2),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              tabs: [
                GButton(
                  onPressed: () {
                    BlocProvider.of<HomeCubit>(context).changeIndex(0);
                  },
                  icon: Icons.home,
                  text: 'خانه',
                ),
                GButton(
                  onPressed: () {
                    BlocProvider.of<HomeCubit>(context).changeIndex(1);
                  },
                  icon: Icons.favorite,
                  text: 'موردعلاقه ها',
                ),
                GButton(
                  onPressed: () {
                    BlocProvider.of<HomeCubit>(context).changeIndex(2);
                  },
                  icon: Icons.person,
                  text: 'پروفایل',
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: AppTheme.secondaryBackgroundColor,
            elevation: 0,
          ),
          backgroundColor: AppTheme.secondaryBackgroundColor,
          body: IndexedStack(
            index: BlocProvider.of<HomeCubit>(context).index,
            children: [
              const HomePage(),
              FavoritesPage(),
              const ProfilePage(),
            ],
          ),
        );
      },
    );
  }
}
