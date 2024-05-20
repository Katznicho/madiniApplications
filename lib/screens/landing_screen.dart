import 'package:flutter/material.dart';
import 'package:madini/screens/home/components/popular_product.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              PopularProducts(),
              SizedBox(height: 20),
              SizedBox(height: 20),
              PopularProducts(),
              SizedBox(height: 20),
              SizedBox(height: 20),
              PopularProducts(),
              SizedBox(height: 20),
              // Add more sections if needed
            ],
          ),
        ),
      ),
    );
  }
}
