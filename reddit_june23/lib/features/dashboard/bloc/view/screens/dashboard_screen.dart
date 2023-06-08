import "package:flutter/material.dart";

import "package:flutter_bloc/flutter_bloc.dart";
import "../../../../group/view/screens/create_group_screen.dart";
import "../../../../user/bloc/user_bloc.dart";
import "../widgets/search_text_field.dart";

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
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
        drawer: drawer(context),
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
        GestureDetector(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer(); // Open the drawer
          },
          child: Container(
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

Widget drawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: const Color(0xffD4ADFC).withOpacity(0.16),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SkillsShout',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 57 + 12),
              Text(
                'Learn by\ncreating or joining group',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black38,
                ),
              ),
            ],
          ),
        ),
        OutlinedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateGroupScreen()),
            ); // Handle Home button tap
          },
          icon: const Icon(Icons.group),
          label: const Text('Create group'),
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all<Size>(
                const Size(205, 40), // Specify the desired width and height
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              )),
        ),
        OutlinedButton.icon(
          onPressed: () {
            // Handle Settings button tap
          },
          icon: const Icon(Icons.group_add_sharp),
          label: const Text('Join group'),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    ),
  );
}
