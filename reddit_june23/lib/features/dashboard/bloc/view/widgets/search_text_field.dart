import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      //controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Search for skills...',
        fillColor: const Color(0xFF5C469C).withOpacity(0.05),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.black38,
        ),
        suffix: GestureDetector(
      onTap: () {
        // Handle button tap
        print('search tapped');
      },
      child: const Icon(Icons.done),
    ),
        
      ),
    );
  }
}
