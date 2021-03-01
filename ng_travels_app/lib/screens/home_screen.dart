import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ng_travels_app/widgets/destination_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab = 0;
  int _selectedIndex;
  List<IconData> icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcons(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: _selectedIndex == index
                ? Theme.of(context).accentColor
                : Color(0xffe7ebee)),
        child: Icon(
          icons[index],
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xff84c1c4),
          size: 25,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(vertical: 30),
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 120),
            child: Text(
              "What you would like to find?",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: icons
                .asMap()
                .entries
                .map((MapEntry map) => _buildIcons(map.key))
                .toList(),
          ),
          DestinationCarousel(),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              title: SizedBox.shrink()),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30,
              ),
              title: SizedBox.shrink()),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 30,
              ),
              title: SizedBox.shrink()),
        ],
      ),
    );
  }
}
