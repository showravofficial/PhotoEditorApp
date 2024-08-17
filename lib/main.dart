import 'package:flutter/material.dart';
import 'package:imgedit/providers/image_provider.dart';
import 'package:imgedit/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ImageProviderClass(),
      child: MaterialApp(
        title: 'Photo Editor App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
