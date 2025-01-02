import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torino/constants/colors.dart';
import 'package:torino/home/cubit/home_cubit.dart';
import 'package:torino/models/tour.dart';

class TourPage extends StatelessWidget {
  final Tour tour;

  const TourPage({super.key, required this.tour});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  BlocProvider.of<HomeCubit>(context).likeTour(tour);
                },
                icon: Icon(
                  BlocProvider.of<HomeCubit>(context).isTourLiked(tour)
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  color: AppTheme.primaryColor,
                ),
              )
            ],
          ),
          body: Column(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.4,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(tour.imageUrl),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(48),
                                ),
                                padding: const EdgeInsets.all(24),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              left: 10,
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                height:
                                    MediaQuery.sizeOf(context).height * 0.10,
                                width: MediaQuery.sizeOf(context).height * 0.3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(48),
                                  color: AppTheme.secondaryBackgroundColor,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          tour.name,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                            fontFamily: AppTheme.fontFamilyName,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.005,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          tour.location,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                            fontFamily: AppTheme.fontFamilyName,
                                          ),
                                        ),
                                        const Icon(Icons.location_on_outlined),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'توضیحات',
                            style: TextStyle(
                              color: Colors.black87,
                              fontFamily: AppTheme.fontFamilyName,
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.sizeOf(context).width * 0.05,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      const Divider(
                        color: Colors.black87,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      Text(
                        tour.description,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.black87,
                          fontFamily: AppTheme.fontFamilyName,
                          fontSize: MediaQuery.sizeOf(context).width * 0.037,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color:
                      AppTheme.secondaryBackgroundColor.withValues(alpha: 0.6),
                  height: MediaQuery.sizeOf(context).height * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.sizeOf(context).height * 0.05,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            'رزرو کنید',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.sizeOf(context).width * 0.04,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppTheme.fontFamilyName,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "${tour.price.toInt()} تومان",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontFamily: AppTheme.fontFamilyName,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.sizeOf(context).width * 0.04,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
