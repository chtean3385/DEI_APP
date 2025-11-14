import 'package:dei_champions/constants/app_navigator.dart';
import 'package:dei_champions/ui/pages/home/components/boost/resume_boost.dart';
import 'package:flutter/material.dart';

import '../../../main/components/drawer/custom_drawer.dart';

/// 🔄 PageView slider for ResumeBoostCards
class ResumeBoostSlider extends StatefulWidget {
  const ResumeBoostSlider({super.key});

  @override
  State<ResumeBoostSlider> createState() => _ResumeBoostSliderState();
}

class _ResumeBoostSliderState extends State<ResumeBoostSlider> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> data = [
    {
      "id": 1,
      "title": "Build trust among recruiters by adding photo",
      "buttonTitle": "Upload photo",
      "boostPercentage": 5.0,
    },
    {
      "id": 2,
      "title": "70% Recruiters prefer candidates with resume",
      "buttonTitle": "Upload resume",
      "boostPercentage": 10.0,
    },
    {
      "id": 3,
      "title": "Recruiters look for your area of work",
      "buttonTitle": "Add department",
      "boostPercentage": 8.0,
    },
    {
      "id": 4,
      "title": "70% Recruiters read your resume headline first",
      "buttonTitle": "Add headline",
      "boostPercentage": 10.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: 100, width: double.infinity),
            ColoredBox(
              color: Colors.white,
              child: SizedBox(height: 40, width: double.infinity),
            ),
            SizedBox(
              height: 100,
              child: PageView.builder(
                controller: _controller,
                itemCount: data.length,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemBuilder: (context, index) {



                  final item = data[index];
                  VoidCallback action;

                  switch (item["id"] as int) { // ensure type is int
                    case 1:
                      action = () => AppNavigator.loadUploadProfilePicScreen(); // wrap in lambda to avoid immediate call
                      break;
                    case 2:
                      action = () => print("Upload resume tapped!");
                      break;
                    case 3:
                      action = () => print("Add department tapped!");
                      break;
                    case 4:
                      action = () => print("Add headline tapped!");
                      break;
                    default:
                      action = () {};
                      print("Unknown id - ${item["id"]}");
                  }

                  return ResumeBoostCard(
                    title: item["title"],
                    buttonTitle: item["buttonTitle"],
                    boostPercentage: item["boostPercentage"],
                    currentPage: _currentPage,
                    totalPages: data.length,
                    onButtonTap: action,
                  );
                },
              ),
            ),

            // indicator row (outside card)
            ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                    data.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: _currentPage == index ? 20 : 10,
                      height: 6,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.orange
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        ProfileSection(showMissingData: true,)
      ],
    );
  }
}
