import "package:flutter/material.dart";

import "package:flutter_bloc/flutter_bloc.dart";
import "../../../../user/bloc/user_bloc.dart";

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: Center(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserStateData) {
              return Text("Hi ${state.userModal.username}");
            }
            return const Text("Something bad happend");
          },
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
