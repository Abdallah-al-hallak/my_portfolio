import 'package:flutter/material.dart';
import 'package:portfolio/home/view/landing_page.dart';
import 'package:portfolio/utils/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //TODO Enum for the color off app bar names
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.9),
        title: Row(children: [
          const SizedBox(width: 200.0, height: 0.0),
          GestureDetector(
            onTap: () {
              print('go to home widget');
            },
            child: Text(
              'Home',
              style: generalTextStyle(),
            ),
          ),
          const SizedBox(width: 30.0, height: 0.0),
          GestureDetector(
            onTap: () {
              print('go to about me widget');
            },
            child: Text(
              'About me',
              style: generalTextStyle(),
            ),
          ),
          const SizedBox(width: 30.0, height: 0.0),
        ]),
      ),
      body: const LandingPageView(),
    );
  }
}
