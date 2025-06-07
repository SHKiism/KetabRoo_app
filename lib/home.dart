import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ketab_roo_app/profile.dart';
import 'package:ketab_roo_app/profile_setting.dart';
import 'package:ketab_roo_app/search.dart';

import 'home_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  int pageIndex = 0;

  final List<Widget> pages = [
    const HomeScreen(),
    const Search(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff2e9dc),
        title:
            pageIndex == 2
                ? const Text(
                  "@mike34",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
                : Text(
                  "سلام، کاربر عزیز 👋",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
        actions:
            pageIndex == 2
                ? [
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.black87),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ProfileSetting(),
                        ),
                      );
                    },
                  ),
                ]
                : null,
      ),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xfff2e9dc),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon:
                pageIndex == 0
                    ? SvgPicture.asset(
                      "assets/icons/home.svg",
                      width: 24,
                      color: Colors.black,
                    )
                    : SvgPicture.asset(
                      "assets/icons/home.svg",
                      width: 24,
                      color: Colors.orange,
                    ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon:
                pageIndex == 1
                    ? SvgPicture.asset(
                      "assets/icons/search.svg",
                      width: 24,
                      color: Colors.black,
                    )
                    : SvgPicture.asset(
                      "assets/icons/search.svg",
                      width: 24,
                      color: Colors.orange,
                    ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon:
                pageIndex == 2
                    ? SvgPicture.asset(
                      "assets/icons/profile.svg",
                      width: 24,
                      color: Colors.black,
                    )
                    : SvgPicture.asset(
                      "assets/icons/profile.svg",
                      width: 24,
                      color: Colors.orange,
                    ),
          ),
        ],
      ),
    );
  }
}
