import 'package:flutter/material.dart';
import 'screens/category_screen.dart';

void main() {
  runApp(MaterialApp(
    home: MyCategoryScreen(title: 'Category Screen'),
     debugShowCheckedModeBanner: false,
  ));
}


class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white, // Remove this line
      child: Center(
        child: Text(
          'This is the category screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}


