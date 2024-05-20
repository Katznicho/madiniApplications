import 'package:flutter/material.dart';

class MySearchDelegate extends SearchDelegate<String> {
  final List<String> _data = [
    'apple',
    'banana',
    'grape',
    'orange',
    'watermelon',
    'mango',
    'pineapple'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = _data.where((item) => item.contains(query)).toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          onTap: () {
            close(context, results[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = _data.where((item) => item.contains(query)).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }

  @override
  InputDecorationTheme get searchFieldDecorationTheme {
    return InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.black), // Placeholder text color
      filled: true,
      fillColor: Colors.white, // Background color of the search field
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  TextStyle get searchFieldStyle {
    return TextStyle(color: Colors.black); // Text color in the search field
  }
}
