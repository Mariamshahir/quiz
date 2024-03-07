import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:quiz/utils/app_assets.dart';
import 'package:badges/badges.dart' as badges;
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

class Workout extends StatefulWidget {
  static const String routeName = "project2";

  const Workout({super.key});

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildListWorkout(),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Workout Programs",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      buildTapBar(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: buildFlashyTabBar());
  }

  Container buildTapBar() {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      height: 650,
      alignment: Alignment.center,
      child: ContainedTabBarView(
        initialIndex: 0,
        tabs: const [
          Text("All Type"),
          Text("Full Body"),
          Text("Upper"),
          Text("Lower")
        ],
        views: [
          Container(
            child: ListView(
              children: const [
                SizedBox(
                  height: 20,
                ),
                Image(image: AssetImage(AppAssets.plank1)),
                SizedBox(
                  height: 20,
                ),
                Image(image: AssetImage(AppAssets.plank2)),
                SizedBox(
                  height: 20,
                ),
                Image(image: AssetImage(AppAssets.plank3)),
              ],
            ),
          ),
          Container(
            child: ListView(
              children: const [
                SizedBox(
                  height: 20,
                ),
                Image(image: AssetImage(AppAssets.plank1)),
                SizedBox(
                  height: 20,
                ),
                Image(image: AssetImage(AppAssets.plank2)),
                SizedBox(
                  height: 20,
                ),
                Image(image: AssetImage(AppAssets.plank3)),
              ],
            ),
          ),
          Container(
            child: ListView(
              children: const [
                SizedBox(
                  height: 20,
                ),
                Image(image: AssetImage(AppAssets.plank1)),
                SizedBox(
                  height: 20,
                ),
                Image(image: AssetImage(AppAssets.plank2)),
                SizedBox(
                  height: 20,
                ),
                Image(image: AssetImage(AppAssets.plank3)),
              ],
            ),
          ),
          Container(
            child: ListView(
              children: const [
                SizedBox(
                  height: 20,
                ),
                Image(image: AssetImage(AppAssets.plank1)),
                SizedBox(
                  height: 20,
                ),
                Image(image: AssetImage(AppAssets.plank2)),
                SizedBox(
                  height: 20,
                ),
                Image(image: AssetImage(AppAssets.plank3)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildListWorkout() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 27),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.monitor_heart_outlined,
                    color: Colors.blueGrey,
                  ),
                  Text("Heart Rate"),
                ],
              ),
              Row(
                children: [
                  Text(
                    "81",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "BPM",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )
                ],
              )
            ],
          ),
          Container(
            height: 50,
            width: 2,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(10)),
          ),
          const Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.list_outlined,
                    color: Colors.blueGrey,
                  ),
                  Text("To-do"),
                ],
              ),
              Row(
                children: [
                  Text(
                    "32,5",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "%",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )
                ],
              )
            ],
          ),
          Container(
            height: 50,
            width: 2,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(10)),
          ),
          const Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.local_fire_department_outlined,
                    color: Colors.blueGrey,
                  ),
                  Text("Calo"),
                ],
              ),
              Row(
                children: [
                  Text(
                    "1000",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "Cal",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  FlashyTabBar buildFlashyTabBar() {
    return FlashyTabBar(
      iconSize: 25,
      selectedIndex: _selectedIndex,
      animationDuration: const Duration(milliseconds: 300),
      items: [
        FlashyTabBarItem(
            icon: const Icon(Icons.home),
            title: const Icon(Icons.home, color: Colors.blueGrey, size: 30),
            inactiveColor: Colors.grey),
        FlashyTabBarItem(
            icon: const Icon(Icons.navigation_outlined),
            title: const Icon(
              Icons.navigation_outlined,
              color: Colors.blueGrey,
              size: 30,
            ),
            inactiveColor: Colors.grey),
        FlashyTabBarItem(
            icon: const Icon(Icons.bar_chart_outlined),
            title: const Icon(Icons.bar_chart_outlined,
                color: Colors.blueGrey, size: 30),
            inactiveColor: Colors.grey),
        FlashyTabBarItem(
            icon: const Icon(Icons.person_2_outlined),
            title: const Icon(Icons.person_2_outlined,
                color: Colors.blueGrey, size: 30),
            inactiveColor: Colors.grey),
      ],
      onItemSelected: (int index) {
        _selectedIndex = index;
        setState(() {});
      },
    );
  }

  AppBar buildAppBar() {
    int badgeCounter = 0;
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Image.asset(
        AppAssets.person,
        width: 50,
        height: 50,
      ),
      title: Row(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello, Jade"),
              Text(
                "Ready to workout?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
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
