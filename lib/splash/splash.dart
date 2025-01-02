import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torino/authentication/cubit/authentication_cubit.dart';
import 'package:torino/constants/colors.dart';
import 'package:torino/home/cubit/home_cubit.dart';
import 'package:torino/home/ui/home.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthenticationCubit>(context).init();
    BlocProvider.of<AuthenticationCubit>(context).checkUserLoggedIn();
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is UserLoggedInState) {
          BlocProvider.of<HomeCubit>(context).user = state.user;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/photos/waterfall.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: MediaQuery.of(context).size.height * 0.1,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      "ماجراجویی هیجان‌انگیز خود را در سراسر ایران با تورینو آغاز کنید!\n  با ما زیباترین مقاصد گردشگری ایران را کشف کنید و تجربه‌هایی فراموش‌نشدنی برای خود بسازید.",
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontFamily: AppTheme.fontFamilyName,
                        fontSize: 18,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'register');
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        minimumSize: const Size(double.infinity, 48),
                        backgroundColor: AppTheme.primaryColor,
                        elevation: 0,
                      ),
                      child: Text(
                        'ثبت‌نام',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: AppTheme.fontFamilyName,
                          color: Colors.white70,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppTheme.primaryColor,
                            thickness: 1,
                            endIndent: 8,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, 'login');
                          },
                          child: Text(
                            'یا وارد شوید',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppTheme.fontFamilyName,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: AppTheme.primaryColor,
                            thickness: 1,
                            indent: 8,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
