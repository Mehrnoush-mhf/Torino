import 'package:flutter/material.dart';
import 'package:torino/authentication/cubit/authentication_cubit.dart';
import 'package:torino/home/cubit/home_cubit.dart';
import 'package:torino/home/ui/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) =>
          BlocProvider.of<AuthenticationCubit>(context).checkUserLoggedIn(),
    );
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
        } else if (state is UserNotLoggedInState) {
          Navigator.pushReplacementNamed(context, '/splash');
        }
      },
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              'assets/images/photos/splash.png',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
