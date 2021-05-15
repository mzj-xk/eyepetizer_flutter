import 'dart:async';

import 'package:eyepetizer_flutter/utils/routes_manager.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      nextPage(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/bg_login.png"), fit: BoxFit.cover),
      ),
      child: null,
    );
  }
}

void nextPage(context) {
  Navigator.of(context).restorablePushNamed(RouteName.bar);
}
