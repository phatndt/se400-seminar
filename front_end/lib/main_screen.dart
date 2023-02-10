import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:front_end/src/core/route/route_path.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text("Hello")),
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(
                  height: 60,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xFF337A5B),
                    ),
                    child: Text(
                      'Your features',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.date_range,
                    color: Color(0xFF337A5B),
                  ),
                  title: const Text(
                    'Time',
                    style: TextStyle(
                      color: Color(0xFF337A5B),
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, RoutePaths.timeoffmain);
                  },
                ),
              ],
            ),
          ),
          body: Center(
            child: Text("HOME SCREEN"),
          )),
    );
  }
}
