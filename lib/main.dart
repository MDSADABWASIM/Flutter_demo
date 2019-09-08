import 'package:demo/services/services.dart';
import 'package:demo/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //Providers that will be consumed in the app.
      providers: [
        ChangeNotifierProvider.value(value: BottomNavigationBarProvider()),
        Provider(builder: (_) => AppDatabase()),
        StreamProvider<UserLocation>(builder: (context) => LocationService().locationStream)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
