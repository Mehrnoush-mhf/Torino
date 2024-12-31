import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torino/authentication/cubit/authentication_cubit.dart';
import 'package:torino/authentication/ui/widgets/form_field.dart';
import 'package:torino/constants/colors.dart';
import 'package:torino/home/cubit/home_cubit.dart';
import 'package:torino/home/ui/home.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if(state is LoginSuccessfulState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => HomeCubit(user: state.user),
                child: Home(),
              ),
            ),
          );
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/photos/background.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppTheme.secondaryBackgroundColor,
                  borderRadius: BorderRadius.circular(44),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Form(
                  key: _key,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ورود',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: AppTheme.secondaryColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppTheme.fontFamilyName,
                              fontSize: MediaQuery.sizeOf(context).width * 0.05,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      formFields(usernameController, 'نام کاربری'),
                      const SizedBox(height: 16),
                      formFields(passwordController, 'رمز عبور'),
                      const SizedBox(height: 24),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.sizeOf(context).width * 0.2),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              BlocProvider.of<AuthenticationCubit>(context).login(
                                usernameController.text,
                                passwordController.text,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            backgroundColor: AppTheme.primaryColor,
                          ),
                          child: Text(
                            'ورود',
                            style: TextStyle(
                              fontSize: MediaQuery.sizeOf(context).width * 0.04,
                              color: AppTheme.backgroundColor,
                              fontFamily: AppTheme.fontFamilyName,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, 'register');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ثبت‌نام کن!',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: AppTheme.primaryColor,
                                fontFamily: AppTheme.fontFamilyName,
                              ),
                            ),
                            Text(
                              'حساب کاربری نداری؟ با تورینو ',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: AppTheme.fontFamilyName,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
