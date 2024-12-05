import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String description;

  OnboardingModel(this.image, this.title, this.description);
}

class OnboardingScreen extends StatefulWidget {
  static const routeName = '/OnboardingView';

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<OnboardingModel> listContentOnboarding = [
    OnboardingModel('assets/images/slide1.png', 'Upgrade skills, \nShow off credentials!', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis  accumsan.'),
    OnboardingModel('assets/images/slide2.png', 'Gain Insights and read \nTrending Articles', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis  accumsan.'),
    OnboardingModel('assets/images/slide3.png', 'Attend Events and \nExpand your network!', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis  accumsan.'),
  ];
  int currentIndex = 0;
  CarouselSliderController carouselCtrl = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              flex: 4,
              child: CarouselSlider(
                  items: listContentOnboarding.map((e) {
                    return SizedBox(
                      width: mediaQuery.width * .7,
                      child: Image.asset(
                        e.image,
                        fit: BoxFit.contain,
                      ),
                    );
                  }).toList(),
                  carouselController: carouselCtrl,
                  options: CarouselOptions(
                    aspectRatio: 1,
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  )),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Text(
                      listContentOnboarding[currentIndex].title,
                      style: const TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                  Text(
                    listContentOnboarding[currentIndex].description,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: listContentOnboarding.asMap().entries.map((e) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            carouselCtrl.animateToPage(e.key);
                          });
                        },
                        child: Container(
                          width: currentIndex == e.key ? 20.0 : 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 3.0,
                          ),
                          decoration: BoxDecoration(
                            // shape: BoxShape.circle,
                            borderRadius: BorderRadius.circular(10),
                            color: currentIndex == e.key ? Colors.red : Colors.grey,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GestureDetector(
                  onTap: () {
                    // if (currentIndex == 2) {
                    //   Navigator.pushNamed(context, LoginView.routeName);
                    // } else {
                    //   carouselCtrl.nextPage();
                    // }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        currentIndex != 2 ? "Skip" : "Start",
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
