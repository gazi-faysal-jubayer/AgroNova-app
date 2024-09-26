import 'package:agro_nova_app/bottom_nav_home.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // Track the current page index
  PageController _pageController = PageController();
  int _currentPageIndex = 0;

  // Define data for the onboarding screens
  final List<Map<String, String>> _onboardingData = [
    {
      'image': "assets/image/onboarding-1.png",
      'title': "Easy Farming",
      'description': "Farming made simple and fun! Learn the basics of planting, harvesting, and making the most of your land. Get started with easy-to-understand tutorials and watch your crops grow!"
    },
    {
      'image': "assets/image/onboarding-2.png",
      'title': "Crop Management",
      'description': "Master the art of crop management! Use real-time data to plan, plant, and nurture your crops. With NASA's help, you'll ensure your farm thrives in every season."
    },
    {
      'image': "assets/image/onboarding-3.png",
      'title': "Community",
      'description': "Connect with farmers and experts around the world! Share tips, get advice, and work together to create the best farming strategies. Build a community for sustainable agriculture."
    },
  ];

  // Function to handle page change
  void _onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // PageView for onboarding screens
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _onboardingData.length,
                  onPageChanged: _onPageChanged,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          _onboardingData[index]['image']!,
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.45,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          _onboardingData[index]['title']!,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          _onboardingData[index]['description']!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              // Next/Get Started button section
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_currentPageIndex < _onboardingData.length - 1) {
                    // Move to the next page
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    // Navigate to the home page
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => BottomNavHome()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  _currentPageIndex < _onboardingData.length - 1 ? "Next" : "Get Started",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
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