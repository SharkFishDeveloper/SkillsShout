import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_june23/features/user/bloc/user_bloc.dart';

import '../../../modals/user_modal.dart';
import '../../details/view/screens/details_screen.dart';
import '../controller/auth_controller.dart';
import '../repository/auth_repository.dart';
import 'login_screen.dart';

class EmailSignUp extends ConsumerStatefulWidget {
  const EmailSignUp({super.key});

  @override
  ConsumerState<EmailSignUp> createState() => _EmailSignUpState();
}

class _EmailSignUpState extends ConsumerState<EmailSignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // void signUpUser(BuildContext context) async {
  //   FireBaseAuthMethods(ref.read(firebaseAuthProvider)).signUpWithEmail(
  //       email: emailController.text,
  //       password: passwordController.text,
  //       context: context);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Back",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(fontSize: 15),
                    )),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "SignUp",
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
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
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
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
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
                    final userbloc = BlocProvider.of<UserBloc>(context);

                    final updatedModal = userbloc.userModal
                        .copyWith(email: emailController.text);

                    print(updatedModal.toString());

                    bool res = await ref
                        .watch(authControllerProvider)
                        .signUpWithEmail(emailController.text,
                            passwordController.text, context);

                    if (res && mounted) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen()));
                    }

                    //  userbloc.add(UserUpdateEvent(updatedModal)); //! should run when sign up is successfull
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  child: const Text('Proceed'),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
