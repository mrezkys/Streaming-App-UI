import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:streaming_app_ui/list_gradient.dart';
import 'package:streaming_app_ui/screens/discover_page.dart';
import 'package:streaming_app_ui/screens/home_page.dart';
import 'package:streaming_app_ui/widgets/circle_blur_painter.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _pageOptions = [
    HomePage(),
    DiscoverPage(),
    Text('data'),
    Text('data'),
  ];

  final ListGradient gradient = ListGradient();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(gradient: gradient.appBackgroundColor),
          child: Stack(
            children: [
              Container(
                child: _pageOptions.elementAt(_selectedIndex),
              ),

              // bottom nav
              // blue accent
              Positioned(
                left: 1,
                bottom: 27,
                child: Container(
                  height: 32,
                  width: 211,
                  color: Color(0xFF563FE2).withOpacity(0.2),
                ),
              ),
              // pink accent
              Positioned(
                right: 49,
                bottom: 17,
                child: Container(
                  height: 32,
                  width: 211,
                  color: Color(0xFFE23FD2).withOpacity(0.2),
                ),
              ),
              // blur background
              Positioned(
                bottom: 0,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
                    child: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Color(0xFF13151C).withOpacity(0.3)),
                    ),
                  ),
                ),
              ),
              // real bottom navigation bar
              Positioned(
                bottom: 0,
                child: Container(
                  color: Colors.transparent,
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: BottomNavigationBar(
                    onTap: _onItemTapped,
                    currentIndex: _selectedIndex,
                    type: BottomNavigationBarType.fixed,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    backgroundColor: Colors.transparent,
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        backgroundColor: Colors.transparent,
                        icon: Stack(
                          children: [
                            SvgPicture.asset('assets/icons/home.svg', color: (_selectedIndex == 0) ? Theme.of(context).primaryColor : Colors.white),
                            (_selectedIndex == 0)
                                ? Positioned(bottom: 3, child: BlurWidget(width: 16, height: 20, blur: 20.0))
                                : SizedBox(
                                    width: 0,
                                  ),
                          ],
                        ),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        backgroundColor: Colors.transparent,
                        icon: Stack(
                          children: [
                            SvgPicture.asset('assets/icons/search.svg', color: (_selectedIndex == 1) ? Theme.of(context).primaryColor : Colors.white),
                            (_selectedIndex == 1)
                                ? Positioned(bottom: 3, child: BlurWidget(width: 16, height: 20, blur: 20.0))
                                : SizedBox(
                                    width: 0,
                                  ),
                          ],
                        ),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        backgroundColor: Colors.transparent,
                        icon: SvgPicture.asset('assets/icons/heart.svg', color: (_selectedIndex == 2) ? Theme.of(context).primaryColor : Colors.white),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        backgroundColor: Colors.transparent,
                        icon: SvgPicture.asset('assets/icons/profil.svg', color: (_selectedIndex == 3) ? Theme.of(context).primaryColor : Colors.white),
                        label: '',
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
