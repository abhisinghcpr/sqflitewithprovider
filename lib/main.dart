import 'package:flutter/material.dart';
import 'package:newproject/views/screens/sqf_lites_screens/sqf_lite_screen/sqf_insert_screen/sqf_insert_screen.dart';
import 'package:newproject/views/screens/sqf_lites_screens/sqf_lite_screen/sqf_screen_widgets/sqf_view_page.dart';
import 'package:provider/provider.dart';

import 'controllers/providers/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<DataProvider>(create: (c) => DataProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DataListWidget() ,
    );
  }
}
