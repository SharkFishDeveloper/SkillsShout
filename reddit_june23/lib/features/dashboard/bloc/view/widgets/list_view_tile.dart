import 'package:flutter/material.dart';
import 'package:reddit_june23/features/user/screens/profile_page.dart';
import 'package:reddit_june23/features/user/bloc/user_bloc.dart';

import '../../../../../modals/user_modal.dart';

class SearchedListItems extends StatefulWidget {
  List<UserModal> searchList = [];
  SearchedListItems({super.key, required this.searchList});

  @override
  State<SearchedListItems> createState() => _SearchedListItemsState();
}

class _SearchedListItemsState extends State<SearchedListItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ListView(
        children: widget.searchList.map((item) {
          return ListTile(
            title: Text(item.username),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfilePage(
                            user: item,
                          )),
                );
              },
            ),
            //subtitle: Text(),
          );
        }).toList(),
      ),
    );
  }
}
