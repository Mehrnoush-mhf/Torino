import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:torino/authentication/cubit/authentication_cubit.dart';
import 'package:torino/authentication/ui/login.dart';
import 'package:torino/authentication/ui/register.dart';
import 'package:torino/home/cubit/home_cubit.dart';
import 'package:torino/home/ui/home.dart';
import 'package:torino/models/tour.dart';
import 'package:torino/models/user.dart';
import 'package:torino/splash/splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TourAdapter());
  Hive.registerAdapter(UserAdapter());
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationCubit>(
          create: (context) => AuthenticationCubit(),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'login': (context) => LoginPage(),
          'register': (context) => RegisterPage(),
          'splash': (context) => const Splash(),
          '/': (context) => Home(),
        },
        initialRoute: 'splash',
      ),
    );
  }
}
