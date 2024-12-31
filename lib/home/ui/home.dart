import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:torino/constants/colors.dart';
import 'package:torino/models/tour.dart';
import 'package:torino/tour/ui/category.dart';
import 'package:torino/tour/ui/tour.dart';

class Home extends StatelessWidget {
  final CarouselSliderController buttonCarouselController =
      CarouselSliderController();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.secondaryBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: AppTheme.fontFamilyName,
                  ),
                  decoration: InputDecoration(
                    hintText: 'جستجو',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: AppTheme.fontFamilyName,
                    ),
                    suffixIcon: const Icon(Icons.search, color: Colors.black),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48),
                      borderSide: BorderSide(
                        color: AppTheme.primaryColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'محبوب‌ترین ها',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: AppTheme.fontFamilyName,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.sizeOf(context).width * 0.05,
                    ),
                  ),
                ],
              ),
            ),
            CarouselSlider.builder(
              options: CarouselOptions(
                height: MediaQuery.sizeOf(context).height * 0.3,
                disableCenter: true,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(seconds: 3),
              ),
              itemCount: 5,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TourPage(tour: tours[itemIndex]),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(tours[itemIndex].imageUrl),
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
                          height: MediaQuery.sizeOf(context).height * 0.14,
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
                                    tours[itemIndex].category,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        fontFamily: AppTheme.fontFamilyName),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height: MediaQuery.sizeOf(context).height *
                                      0.005),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${tours[itemIndex].price.toInt()} تومان",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontFamily: AppTheme.fontFamilyName,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    tours[itemIndex].name,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontFamily: AppTheme.fontFamilyName,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height: MediaQuery.sizeOf(context).height *
                                      0.005),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    tours[itemIndex].location,
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
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'دسته‌بندی',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: AppTheme.secondaryColor,
                      fontFamily: AppTheme.fontFamilyName,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.sizeOf(context).width * 0.05,
                    ),
                  ),
                ],
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.4,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CategoryPage(
                              category: categoryNames[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Colors.black),
                                image: DecorationImage(
                                  image: AssetImage(categoryAssets[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              width: MediaQuery.sizeOf(context).width * 0.6,
                              height: MediaQuery.sizeOf(context).width * 0.3,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.01),
                            Text(
                              categoryNames[index],
                              style: TextStyle(
                                color: AppTheme.textColor,
                                fontFamily: AppTheme.fontFamilyName,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
