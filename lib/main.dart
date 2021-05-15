import 'package:eyepetizer_flutter/utils/routes_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: RouteName.splash,
        onGenerateRoute: MyRouter.generateRoute);
  }
}
