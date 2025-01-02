import 'package:flutter/material.dart';
import 'package:torino/constants/colors.dart';
import 'package:torino/models/tour.dart';
import 'package:torino/tour/ui/tour.dart';

class CategoryPage extends StatelessWidget {
  final String category;

  const CategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    List<Tour> tourList = tours
        .where(
          (element) => element.category == category,
        )
        .toList();

    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          category,
          style: TextStyle(
            fontFamily: AppTheme.fontFamilyName,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: tourList.length,
        itemBuilder: (context, index) {
          final tour = tourList[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TourPage(
                    tour: tour,
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(16),
              height: MediaQuery.of(context).size.height * 0.3,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(tour.imageUrl),
                          fit: BoxFit.cover,
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
                      height: screenSize.height * 0.14,
                      width: screenSize.width * 0.8, // Adjusted the width
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
                            height: screenSize.height * 0.005,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "${tour.price.toInt()} تومان",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  fontFamily: AppTheme.fontFamilyName,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenSize.height * 0.005,
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
          );
        },
      ),
    );
  }
}
