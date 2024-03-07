import 'package:badges/badges.dart' as badges;
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:quiz/utils/app_assets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Moody extends StatefulWidget {
  static const String routeName = "project1";

  const Moody({Key? key}) : super(key: key);

  @override
  State<Moody> createState() => _MoodyState();
}

class _MoodyState extends State<Moody> {
  PageController pageController = PageController();
  int currentPage = 0;

  List<String> frameImage = [
    AppAssets.frame,
    AppAssets.frame,
    AppAssets.frame,
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text(
                      "Hello,",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Sara Rose",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "How are you feeling today ?",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(AppAssets.love),
                    Image.asset(AppAssets.cool),
                    Image.asset(AppAssets.happy),
                    Image.asset(AppAssets.sad),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            "Feature",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                "See more",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 200,
                        child: PageView.builder(
                          controller: pageController,
                          itemCount: frameImage.length,
                          itemBuilder: (_, index) => Container(
                            height: 200,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.transparent,
                              image: DecorationImage(
                                image: AssetImage(frameImage[index]),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      buildSmoothPageIndicator(),
                      const SizedBox(
                        height: 40,
                      ),
                      buildExercise(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: buildFlashyTabBar());
  }

  FlashyTabBar buildFlashyTabBar() {
    return FlashyTabBar(
      iconSize: 25,
      selectedIndex: _selectedIndex,
      animationDuration: const Duration(milliseconds: 300),
      items: [
        FlashyTabBarItem(
            icon: const Icon(Icons.home),
            title: const Icon(Icons.home, color: Colors.green, size: 30),
            activeColor: Colors.green,
            inactiveColor: Colors.grey),
        FlashyTabBarItem(
            icon: const Icon(Icons.apps),
            title: const Icon(
              Icons.apps,
              color: Colors.green,
              size: 30,
            ),
            activeColor: Colors.green,
            inactiveColor: Colors.grey),
        FlashyTabBarItem(
            icon: const Icon(Icons.calendar_today_outlined),
            title: const Icon(Icons.calendar_today_outlined,
                color: Colors.green, size: 30),
            activeColor: Colors.green,
            inactiveColor: Colors.grey),
        FlashyTabBarItem(
            icon: const Icon(Icons.person_2_outlined),
            title: const Icon(Icons.person_2_outlined, color: Colors.green, size: 30),
            activeColor: Colors.green,
            inactiveColor: Colors.grey),
      ],
      onItemSelected: (int index) {
        _selectedIndex = index;
        setState(() {});
      },
    );
  }

  SmoothPageIndicator buildSmoothPageIndicator() {
    return SmoothPageIndicator(
      controller: pageController,
      count: frameImage.length,
      effect: const WormEffect(),
    );
  }

  Container buildExercise() {
    return Container(
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                "Exercise",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    "See more",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.green,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: const Color(0x66B591F5),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Image.asset(AppAssets.relaxation),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text(
                          "Relaxation",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: const Color(0x66F9A6DF),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Image.asset(AppAssets.meditation),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text(
                          "Meditation",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    decoration: BoxDecoration(
                        color: Color(0x4DFCB173),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Image.asset(AppAssets.beathing),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text(
                          "Beathing",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    decoration: BoxDecoration(
                        color: const Color(0x4D7BD3FC),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Image.asset(AppAssets.yoga),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text(
                          "Yoga",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    int badgeCounter = 0;
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Image.asset(
        AppAssets.moody,
        width: 50,
        height: 50,
      ),
      title: Row(
        children: [
          const Text("Moody"),
          const Spacer(),
          badges.Badge(
              badgeContent: Text("${badgeCounter.toString()}"),
              child: const Icon(
                Icons.notifications_none,
                size: 30,
              )),
        ],
      ),
    );
  }
}