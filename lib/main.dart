import 'package:ecommerce_getpost_api/Provider/home_provider.dart';
import 'package:ecommerce_getpost_api/View/insert_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'View/home_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => HomeProvider(),
      ),
    ],
    child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: 'second',
      routes: {
        '/': (context) => HomeScreen(),
        'second': (context) => SecondScreen(),
      },
    ),
  ));
}
