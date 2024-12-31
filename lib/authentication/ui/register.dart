import 'package:flutter/material.dart';
import 'package:torino/authentication/ui/widgets/form_field.dart';
import 'package:torino/constants/colors.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController nationalCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ثبت‌نام',
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
                  const SizedBox(height: 16),
                  formFields(emailController, 'ایمیل'),
                  const SizedBox(height: 16),
                  formFields(phoneNumberController, 'تلفن همراه'),
                  const SizedBox(height: 16),
                  formFields(nationalCodeController, 'کد ملی'),
                  const SizedBox(height: 24),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).width * 0.2),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: AppTheme.primaryColor,
                      ),
                      child: Text(
                        'ثبت‌نام',
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
                      Navigator.pushReplacementNamed(context, 'login');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'تورینو وارد شو!',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: AppTheme.primaryColor,
                            fontFamily: AppTheme.fontFamilyName,
                          ),
                        ),
                        Text(
                          'حساب کاربری داری؟ با ',
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
        ],
      ),
    );
  }
}
