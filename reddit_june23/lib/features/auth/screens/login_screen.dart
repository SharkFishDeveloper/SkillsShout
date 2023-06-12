import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_june23/features/dashboard/bloc/view/screens/dashboard_screen.dart';
import 'package:reddit_june23/features/user/bloc/user_bloc.dart';
//import 'package:signin_login/firebase_auth.dart';

import '../../../core/common/scaffold_messanger.dart';
import '../controller/auth_controller.dart';
import '../repository/auth_repository.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _EmailSignUpState();
}

class _EmailSignUpState extends ConsumerState<LoginScreen> {
  bool isLoading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          // title: const Text(
          //   "Back",
          //   style: TextStyle(fontSize: 16),
          // ),
          ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UserErrorState) {
              return showSnackBar(context, state.errorMessage);
            }
          },
          builder: (context, state) {
            if (state is LoadingUsserState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Enter email and password',
                          style: TextStyle(fontSize: 15),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "LogIn",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter email',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Enter password',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        bool res = await ref
                            .watch(authControllerProvider)
                            .loginWithEmail(emailController.text,
                                passwordController.text, context);

                        if (res && mounted) {
                          final userBloc = BlocProvider.of<UserBloc>(context);
                          userBloc.add(GetUserDataFromFirestoreEvent());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DashboardScreen()));
                        } else if (res == false && mounted) {
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : const Text('Proceed'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
