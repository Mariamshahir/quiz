import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:quiz/utils/app_assets.dart';
import 'package:chips_choice/chips_choice.dart';

class AliceCare extends StatefulWidget {
  static const String routeName = "project3";

  const AliceCare({Key? key}) : super(key: key);

  @override
  State<AliceCare> createState() => _AliceCareState();
}

class _AliceCareState extends State<AliceCare> {
  int currentIndexTab = 0;
  int selectedChoice = 0;
  List<String> choices = ["Discover", "News", "Most Viewed", "Saved"];
  List<String> frames = [AppAssets.frame1, AppAssets.frame2];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            children: [
              const SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      Image(image: AssetImage(AppAssets.logo)),
                    ],
                  ),
                ),
              ),
              buildSearch(),
              buildChipsChoice(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 15),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          "Hot topics",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Text(
                              "See all",
                              style: TextStyle(
                                  color: Color(0xff5925DC), fontSize: 15),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                color: Color(0xff5925DC)),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 18),
                    buildCarouselSlider(),
                  ],
                ),
              ),
              buildContainerGitTips(),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      child: Center(
        child: TextField(
          enabled: true,
          decoration: InputDecoration(
            prefixIcon: IconButton(
              icon: const Icon(
                Icons.search_rounded,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
            hintText: "Articles, Video, Audio and More,...",
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 18),
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2),
            ),
          ),
        ),
      ),
    );
  }

  Container buildContainerGitTips() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Get Tips",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 16,
          ),
          Image(image: AssetImage(AppAssets.frame3)),
          SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Text(
                "Cycle Phases and Period",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    "See all",
                    style: TextStyle(color: Color(0xff5925DC), fontSize: 15),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Color(0xff5925DC)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  CarouselSlider buildCarouselSlider() {
    return CarouselSlider(
      items: frames.map((frame) {
        return Image.asset(
          frame,
          fit: BoxFit.fill,
          width: 600,
        );
      }).toList(),
      options: CarouselOptions(
        height: 200,
        enlargeCenterPage: true,
        autoPlay: true,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 500),
        viewportFraction: 0.9,
      ),
    );
  }

  ChipsChoice<int> buildChipsChoice() {
    return ChipsChoice<int>.single(
      value: selectedChoice,
      onChanged: (val) => setState(() => selectedChoice = val),
      choiceItems: C2Choice.listFrom<int, String>(
        source: choices,
        value: (i, v) => i,
        label: (i, v) => v,
        tooltip: (i, v) => v,
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      currentIndex: currentIndexTab,
      onTap: (newTabIndex) {
        setState(() {
          currentIndexTab = newTabIndex;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_outlined),
          label: "Today",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view_sharp),
          label: "Insights",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline),
          label: "Chat",
        ),
      ],
    );
  }
}
