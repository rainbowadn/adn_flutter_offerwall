import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:adn_flutter_offerwall/adn_flutter_offerwall_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initOfferWall();
  }

  Future<void> initOfferWall() async {
    final appKey = Platform.isAndroid
        ? "278319633773876"
        : Platform.isIOS
            ? "220042543331989"
            : throw Exception("Unsupported Platform");
    OfferWall.init(appKey: appKey);
    OfferWall.setUserId(userId: 'userId');
    OfferWall.setGender(gender: 'M');
    OfferWall.setBirthYear(birthYear: 1992);
  }

  Future<void> showOfferWall() async {
    OfferWall.showOfferWall(title: "Get point");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Text("Show OfferWalls"),
                onPressed: () {
                  showOfferWall();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
