import "package:flutter/material.dart";

import "package:flutter_bloc/flutter_bloc.dart";
import "../../../../user/bloc/user_bloc.dart";
import "../widgets/search_text_field.dart";

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text("Dashboard"),
        // ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  menuAndUserIconRow(),
                  const SizedBox(
                    height: 40,
                  ),
                  welcomeName(context, state),
                  const SizedBox(
                    height: 24,
                  ),
                  const SearchTextField(),
                ],
              );
            },
          ),
        ),
        drawer: const Drawer(),
      ),
    );
  }

  Widget welcomeName(BuildContext context, UserState state) {
    if (state is UserStateData) {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Welcome\n',
              style: TextStyle(
                letterSpacing: 2,
                fontSize: 20,
                // fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.40),
              ),
            ),
            TextSpan(
              text: state.userModal.username,
              style: const TextStyle(
                letterSpacing: 2,
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            )
          ],
        ),
      );
    }
    return const Text("Welcome");
  }

  Widget menuAndUserIconRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.black26,
              width: 1.0,
            ),
          ),
          child: const Icon(Icons.menu),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.black26,
              width: 1.0,
            ),
          ),
          child: const Icon(Icons.person),
        ),
      ],
    );
  }
}
