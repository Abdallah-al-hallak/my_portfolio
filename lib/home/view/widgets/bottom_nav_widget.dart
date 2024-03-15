import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SalomonBottomBar(
      // margin: EdgeInsets.all(10),

      itemShape: OutlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(10)),

      backgroundColor: Colors.black26,

      currentIndex: _currentIndex,
      onTap: (i) {
        print(i);
        widget.scrollController.animateTo(i * size.height,
            duration: const Duration(seconds: 1), curve: Curves.ease);
        setState(() => _currentIndex = i);
      },
      items: [
        /// Home
        SalomonBottomBarItem(
          unselectedColor: Colors.white54,
          icon: Text(
            "Home",
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 11.r),
          ),
          title: Text(""),
          selectedColor: Colors.purple,
        ),

        /// Likes
        SalomonBottomBarItem(
          icon: Text(
            "About",
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 11.r),
          ),
          title: Text(""),
          selectedColor: Colors.pink,
        ),

        /// Search
        SalomonBottomBarItem(
          icon: Text(
            "Projects",
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 11.r),
          ),
          title: Text(""),
          selectedColor: Colors.orange,
        ),

        /// Profile
        SalomonBottomBarItem(
          icon: Text(
            "Skills",
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 11.r),
          ),
          title: Text(""),
          selectedColor: Colors.teal,
        ),
        SalomonBottomBarItem(
          icon: Text(
            "Contact ",
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 11.r),
          ),
          title: Text(""),
          selectedColor: Colors.amber,
        ),
      ],
    );
  }
}
