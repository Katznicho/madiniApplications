import 'package:flutter/material.dart';
import 'package:madini/widgets/product_card.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: List.generate(
                5,
                (index) {
                  return const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: ProductCard(
                      imageUrl: "assets/images/download.jpeg",
                      name: "Lwera Sand",
                      price: "25,000",
                      category: 'Test',
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
