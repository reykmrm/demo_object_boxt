import 'package:demo_object_boxt/src/home_page.dart';
import 'package:demo_object_boxt/src/store.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Database.open();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ObjectBox Example',
      home: HomePage(),
    );
  }
}
