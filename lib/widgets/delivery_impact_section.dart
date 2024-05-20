import 'package:flutter/material.dart';

class DeliveryImpactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Delivery: Place"),
          Text("Impact: 1,218 Artisans"),
        ],
      ),
    );
  }
}
