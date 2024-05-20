import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white, // Background color of the search bar
        borderRadius: BorderRadius.circular(30), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // Position of shadow
          ),
        ],
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.black), // Placeholder text color
          prefixIcon:
              Icon(Icons.search, color: Colors.black), // Search icon color
          border: InputBorder.none, // Removes underline
          filled: true,
          fillColor: Colors.white, // Ensure the fill color is white
        ),
      ),
    );
  }
}
