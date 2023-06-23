import 'package:flutter/material.dart';
import 'package:blogger/screens/blog_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 244, 237, 105)),
      home: const BlogListPageState(),
    );
  }
}
