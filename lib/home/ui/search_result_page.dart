import 'package:flutter/material.dart';
import 'package:torino/constants/colors.dart';
import 'package:torino/models/tour.dart';
import 'package:torino/tour/ui/tour.dart';

class SearchResultWidget extends StatelessWidget {
  final List<Tour> searchResults;

  const SearchResultWidget({super.key, required this.searchResults});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final tour = searchResults[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          height: MediaQuery.sizeOf(context).height * 0.4,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TourPage(tour: tour),
                ),
              );
            },
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
                          height: MediaQuery.sizeOf(context).height * 0.005,
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
    );
  }
}
