import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_june23/core/common/scaffold_messanger.dart';

import '../../../../modals/user_modal.dart';
import '../bloc/user_bloc.dart';

class UpdateProfilePage extends StatefulWidget {
  final UserModal user;

  const UpdateProfilePage({super.key, required this.user});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserStateData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter your username',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _updateUsername();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(
                          0xFF1D267D), // Color in hexadecimal format
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      elevation: 5.0,
                    ),
                    child: const Text(
                      'Update Profile',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              );
            } else if (state is LoadingUsserState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return const Center(
              child: Text("Some unexpected happened!"),
            );
          },
        ),
      ),
    );
  }

  void _updateUsername() {
    String newUsername = _usernameController.text;

    if (newUsername != widget.user.username) {
      // Perform the update logic here
      UserModal updatedUser = widget.user.copyWith(username: newUsername);
      final userBloc = BlocProvider.of<UserBloc>(context);

      userBloc.add(UserUpdateEvent(
          userModal: updatedUser, message: "Successfully updated"));
      // Only update if the new username is different from the original username

      print('Updating username to: $newUsername');
    } else {
      print('New username is the same as the original username');
      showSnackBar(context, "Try changing the username");
    }
  }
}
