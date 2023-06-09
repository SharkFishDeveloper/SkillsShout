import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_june23/features/user/bloc/user_bloc.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController _searchFeatureController =
      TextEditingController();
  SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchFeatureController,
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
            final userBloc = BlocProvider.of<UserBloc>(context);
            userBloc.add(SearchUserEventInFirestore(
                searchString: _searchFeatureController.text));
            print('search tapped');
          },
          child: const Icon(Icons.done),
        ),
      ),
    );
  }
}
