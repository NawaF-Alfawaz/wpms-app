import 'package:cloud_firestore/cloud_firestore.dart';
import 'welcome_screen.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart' as db;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = db.FirebaseFirestore.instance;
  final _auth = auth.FirebaseAuth.instance;
  auth.User? loggedInUser;
  String? messeageText;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      // final user = await _auth.currentUser;
      // if (user != null) {
      //   loggedInUser = user;
      // }
    } catch (e) {
      print(e);
    }
  }

  void getMessages() async {
    // await for (var snapshot in _firestore.collection('Messages').snapshots()) {
    //   for (var doc in snapshot.docs) {
    //     print(doc.data());
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //getMessages();
                _auth.signOut();
                Navigator.pop(context);
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('Messages').snapshots(),
              // ignore: missing_return
              builder: ((context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator(
                    backgroundColor: Colors.lightBlueAccent,
                  );
                }
                final messages = snapshot.data!.docs;
                List<Text> messagesWidgets = [];
                for (var message in messages) {
                  final messageText = message.get('text');
                  final messageSender = message.get('sender');

                  final messageWidget =
                      Text('$messageText From $messageSender');
                  messagesWidgets.add(messageWidget);
                }
                return Column(
                  children: messagesWidgets,
                );
              }),
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        messeageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _firestore.collection('Messages').add({
                        'text': messeageText,
                        'sender': loggedInUser!.email,
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
