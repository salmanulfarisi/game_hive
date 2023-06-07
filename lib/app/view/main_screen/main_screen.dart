import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:game_hive/app/utils/themes.dart' as style;
import 'package:game_hive/app/view/games/games.dart';
import 'package:game_hive/app/view/home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF20232A),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0), child: Container()),
      body: SizedBox.expand(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (value) {
            setState(() {
              _currentIndex == value;
            });
          },
          children: [
            const HomeScreen(),
            const GameScreen(),
            Container(
              child: const Center(
                child: Text('Messages'),
              ),
            ),
            Container(
              child: const Center(
                child: Text('Profile'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        child: BottomNavyBar(
          backgroundColor: style.Colors.backgroundColor,
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              activeColor: const Color(0xFF010101),
              icon: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Icon(
                  SimpleLineIcons.home,
                  size: 20.0,
                  color: _currentIndex == 0
                      ? style.Colors.mainColor
                      : Colors.white,
                ),
              ),
              title: const Text(
                'Home',
                style: TextStyle(
                  color: style.Colors.mainColor,
                  fontSize: 13.0,
                ),
              ),
            ),
            BottomNavyBarItem(
              activeColor: const Color(0xFF010101),
              icon: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Icon(
                  SimpleLineIcons.game_controller,
                  size: 18.0,
                  color: _currentIndex == 0
                      ? style.Colors.mainColor
                      : Colors.white,
                ),
              ),
              title: const Text(
                'Discover',
                style: TextStyle(
                  color: style.Colors.mainColor,
                  fontSize: 13.0,
                ),
              ),
            ),
            BottomNavyBarItem(
              activeColor: const Color(0xFF010101),
              icon: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Icon(
                  SimpleLineIcons.envelope,
                  size: 18.0,
                  color: _currentIndex == 0
                      ? style.Colors.mainColor
                      : Colors.white,
                ),
              ),
              title: const Text(
                'Messages',
                style: TextStyle(
                  color: style.Colors.mainColor,
                  fontSize: 13.0,
                ),
              ),
            ),
            BottomNavyBarItem(
              activeColor: const Color(0xFF010101),
              icon: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Icon(
                  SimpleLineIcons.user,
                  size: 18.0,
                  color: _currentIndex == 0
                      ? style.Colors.mainColor
                      : Colors.white,
                ),
              ),
              title: const Text(
                'Me',
                style: TextStyle(
                  color: style.Colors.mainColor,
                  fontSize: 13.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
