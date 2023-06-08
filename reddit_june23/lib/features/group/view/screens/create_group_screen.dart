import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_june23/features/group/bloc/group_bloc.dart';
import 'package:reddit_june23/features/user/bloc/user_bloc.dart';

class CreateGroupScreen extends StatefulWidget {
  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  final TextEditingController _groupNameController = TextEditingController();
  final TextEditingController _groupBioController = TextEditingController();

  @override
  Widget build(BuildContext context2) {
    // final groupBloc = BlocProvider.of<GroupBloc>(context2);
    final groupBloc = GroupBloc();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Group'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<GroupBloc, GroupState>(
          builder: (context, groupstate) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _groupNameController,
                  decoration: const InputDecoration(
                    labelText: "Enter group name",
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 16.0),
                Expanded(
                  child: TextField(
                    maxLines: null,
                    controller: _groupBioController,
                    decoration: const InputDecoration(
                      labelText: 'Enter group details',
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(fontSize: 18.0),
                  ),
                ),
                const SizedBox(height: 16.0),
                BlocBuilder<UserBloc, UserState>(
                  builder: (context1, state) {
                    if (state is UserStateData) {
                      return ElevatedButton.icon(
                        onPressed: () {
                          groupBloc.add(CreateGroupAndStoreFireStoreEvent(
                              userWhoCreatedGroup: state.userModal,
                              groupName: _groupNameController.text,
                              groupDescription: _groupBioController.text));
                          print("fireevent done");
                        },
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text('Proceed'),
                      );
                    }
                    return const Text("No user state");
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
