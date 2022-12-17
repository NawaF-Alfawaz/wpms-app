import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '/screens/profile_screen.dart';

import 'welcome_screen.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class CustomerScreen extends StatefulWidget {
  static const String id = 'customer_screen';
  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  final _auth = auth.FirebaseAuth.instance;
  auth.User? loggedInUser;
  String? messeageText;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

// this is how to get the current user
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  void test() async {
    User user = FirebaseAuth.instance.currentUser!;
    final packages =
        await FirebaseFirestore.instance.collection('packages').get();
    FirebaseFirestore.instance.collection('packages').add({
      'PackageID': packages.docs.length + 1,
      'UserId': user.uid,
      'Cost': 500,
      'Status': 'Received',
      'Type': 'Regular',
      'FDD': 'Jeddah',
      'Destination': 'Riyadh',
      'Insurance': 100,
      'Dimenstions': 10,
      'Weight': 20,
    });
    /*FirebaseFirestore.instance
        .collection('Location History')
        .doc()
        .collection("LocatedAt")
        .add({
      'City': 'Dammam',
      'ReceivedAt': Timestamp.now(),
    });*/
  }

  @override
  Widget build(BuildContext context) {
    test();
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
              child: Text('Hello'),
            ),
            ListTile(
              title: const Text('Account Information'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushNamed(context, ProfileScreen.id);
              },
            ),
            ListTile(
              title: const Text('Sign out'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                _auth.signOut();
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        //leading: null,
        title: const Text('Main Screen '),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        color: Colors.black,
                        height: 50,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.red,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
