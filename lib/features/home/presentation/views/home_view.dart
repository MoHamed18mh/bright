import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: 40,
          itemBuilder: (context, index) => Container(
            color: Colors.blue,
            height: 100,
            margin: EdgeInsets.all(10),
          ),
        ),
      ),
    );
  }
}
