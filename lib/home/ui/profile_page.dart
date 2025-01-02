import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torino/constants/colors.dart';
import 'package:torino/home/cubit/home_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.secondaryBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundColor: AppTheme.primaryColor.withValues(alpha: 0.4),
                  radius: 50,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: AppTheme.primaryColor,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
              Text(
                BlocProvider.of<HomeCubit>(context).user.username,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.sizeOf(context).width * 0.05,
                ),
              ),
              Text(
                BlocProvider.of<HomeCubit>(context).user.email,
                style: TextStyle(
                  fontSize: MediaQuery.sizeOf(context).width * 0.04,
                ),
              ),
              Divider(color: AppTheme.primaryColor),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.015),
              InkWell(
                onTap: () {
                  BlocProvider.of<HomeCubit>(context).logout();
                },
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout_rounded,
                        color: AppTheme.primaryColor,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'خروج از حساب کاربری',
                        style: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).width * 0.04,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
