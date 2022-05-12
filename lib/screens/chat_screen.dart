import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/chat/messages.dart';
import '../widgets/chat/new_message.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('FlutterChat'),
          actions: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButton(
                items: [
                  DropdownMenuItem(
                    child: Container(
                      child: Row(
                        children: [
                          Icon(Icons.exit_to_app, color: Colors.grey),
                          SizedBox(
                            width: 8,
                          ),
                          Text('Logout'),
                        ],
                      ),
                    ),
                    value: 'Logout',
                  ),
                ],
                onChanged: (itemIdentifier) {
                  if (itemIdentifier == 'Logout') {
                    FirebaseAuth.instance.signOut();
                  }
                },
                icon: Icon(Icons.more_vert,
                    color: Theme.of(context).primaryIconTheme.color),
              ),
            )
          ],
        ),
        body: Container(
          child: Column(children: [
            Expanded(
              child: Messages(),
            ),
            NewMessage(),
          ]),
        ),
      ),
    );
  }
}
