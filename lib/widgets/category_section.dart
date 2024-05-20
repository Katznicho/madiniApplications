import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3, // Number of categories
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            child: Column(
              children: [
                Icon(Icons.category), // Replace with category-specific icons
                Text('Category $index')
              ],
            ),
          );
        },
      ),
    );
  }
}
