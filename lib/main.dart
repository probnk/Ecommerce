import 'package:ecommerce/Home/FavouriteNotifier.dart';
import 'package:ecommerce/Home/Home_Notifier.dart';
import 'package:ecommerce/Home/Home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
            ChangeNotifierProvider(create: (_) => Home_Notifier()),
            ChangeNotifierProvider(create: (_) => FavouriteNotifier())
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
