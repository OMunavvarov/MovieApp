import 'package:flutter/material.dart';
import 'package:movie_api/screens/home_page.dart';
import 'package:movie_api/view_model/details_view_model.dart';
import 'package:movie_api/view_model/main_view_model.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MainViewModel()),
      ChangeNotifierProvider(create: (_) => DetailsViewModel()),
    ],
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}
