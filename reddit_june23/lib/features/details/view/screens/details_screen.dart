import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_june23/features/user/bloc/user_bloc.dart';

import '../../../../modals/user_modal.dart';

class DetailsScreen extends StatefulWidget {
  final String email;
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
  const DetailsScreen({required this.email});
}

class _DetailsScreenState extends State<DetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    _bioController.dispose();
    _skillsController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform form submission logic here
      // For example, save form data to a database
      // or send it to an API
      String name = _nameController.text;
      String phone = _phoneController.text;
      String city = _cityController.text;
      String bio = _bioController.text;
      //String skills = _skillsController.text;
      User? currentUser = FirebaseAuth.instance.currentUser;
      String uid = currentUser!.uid;
      final userModal = UserModal(
          uid: uid,
          username: name,
          phoneNumber: phone,
          isAdmin: false,
          email: widget.email,
          idOfFollowers: [],
          city: city,
          bio: bio,
          skill: ["tree", "plants"],
          rating: "");

      print('Name: $name');
      print('Phone: $phone');
      print('City: $city');
      print('Bio: $bio');
      //print('Skills: $skills');
      final userBloc = BlocProvider.of<UserBloc>(context);
      userBloc.add(UserUpdateEvent(userModal));
      userBloc.add(StoreUserDataEventInFirestore(userModal));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone No.'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cityController,
                decoration: const InputDecoration(labelText: 'City'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your city';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _bioController,
                decoration: const InputDecoration(labelText: 'Bio'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your bio';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _skillsController,
                decoration: const InputDecoration(labelText: 'Skills'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your skills';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Done'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
