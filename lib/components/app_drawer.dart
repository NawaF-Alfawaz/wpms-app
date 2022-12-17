import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../screens/customer_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/welcome_screen.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key}) : super(key: key);
  final _auth = auth.FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            elevation: 1,
            backgroundColor: const Color.fromRGBO(0, 0, 139, 1),
            centerTitle: true,
            automaticallyImplyLeading: false, // back button: false
          ),
          ListTile(
            leading: const Icon(Icons.local_shipping_outlined),
            title: const Text('Track Package'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(CustomerScreen.id);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit Profile'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(ProfileScreen.id);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              _auth.signOut();
              Navigator.pop(context);
              Navigator.of(context).pushReplacementNamed(WelcomeScreen.id);
            },
          ),
        ],
      ),
    );
  }
}
