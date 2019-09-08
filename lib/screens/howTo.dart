import 'package:flutter/material.dart';

//A simple how to use screen.
class HowToUse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('How to Use'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          Text('''
First Task

1. Navigate to Location page, Allow all permisions to access location.
2. Tap on the top right icon in location page to go to your current location.
3. Long press anywhere in the app to add marker.
4. Long press will open a pop up fill the name of place and click done icon of keyboard to add the marker.
5. Tap on the marker to see marker detail.


Second Task


1. As you go in this page it will automatically load pdf from app local database and show it.
2. You can go to drawer and click on "Load from URL" it will load a pdf from web and show it.
3. You can change the page by clicking on next or previous icon.
4. You can go to any page using floating action button in the center.


Third Task


I am using Fancy Toast and Toasty plugin which are available for native android sdk.

I have given you the other apk to test that, because these two native plugins are NOT MIGRATED TO ANDROIDX, and that's why I can not use it inside this project(this project is migrated to androidx).
       
       ''', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.black))
        ],
      ),
    );
  }
}
