import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:demo/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Homepage used for navigation between pages, and consuming provider.
class HomePage extends StatelessWidget {
  final List<Widget> _children = [
    HowToUse(),
    Location(),
    PdfViewer(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);

    return Scaffold(
      body: _children[provider.currentIndex],
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.currentIndex = index;
        },
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        hasInk: true, //new, gives a cute ink effect
        inkColor: Colors.black12, //optional, uses theme color if not specified
        items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
              backgroundColor: Colors.purple,
              icon: Icon(
                Icons.bookmark_border,
                color: Colors.green,
              ),
              activeIcon: Icon(
                Icons.bookmark,
                color: Colors.green,
              ),
              title: Text("How to Use")),
          BubbleBottomBarItem(
              backgroundColor: Colors.green[400],
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.green,
              ),
              title: Text("Location")),
          BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(
                Icons.book,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.book,
                color: Colors.blue,
              ),
              title: Text("PDF")),
        
        ],
      ),
    );
  }
}

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;

  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
