import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _fireStore = FirebaseFirestore.instance;
late User sinInUser; //this will give email

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final textController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  ///save write message//
  String? messageText; //this will give text
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  ///get data in fireStore//in message ////
  void getMessagesInFireStoreUseStream() async {
    await for (var snap in _fireStore.collection('massege').snapshots()) {
      ///docs => get data in fireStore//
      for (var message in snap.docs) {
        print(message.data());
      }
    }
  }

  /// user score or no //
  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        sinInUser = user;
        print(sinInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            // Image.asset(
            //     'assets/images/istockphoto-1300338138-612x612y.jpg',
            //     height: 50,),
            Text('message ')
          ],

        ),
        actions: [
          IconButton(
            onPressed: () {
              // add here logout function
              _auth.signOut();
              Navigator.pop(context);
            },
            icon: Icon(Icons.close,color:Colors.white,),
          )
        ],
      ),
      //body
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessageStreamBuilder(),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.purpleAccent,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                      onChanged: (value) {
                        ///convert  message in messageText//
                        messageText = value;
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        hintText: 'Write your message here...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _fireStore.collection('massege').add({
                        'text': messageText,
                        'sender': sinInUser.email,
                        'time':FieldValue.serverTimestamp(),
                      });
                      textController.clear();
                    },
                    child: Text(
                      'send',
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageLine extends StatelessWidget {
  MessageLine({this.messageText, this.messageSender,required this.isMe, super.key});

  String? messageText;
  String? messageSender;
  bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:isMe? CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          ///name email //
          Text(
            '$messageSender',
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(
            height: 5,
          ),
          Material(
            color:isMe? Colors.purple[300]: Colors.grey[500],
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                '$messageText',
                style: TextStyle(fontSize: 15),
              ),
            ),
            borderRadius:isMe? const BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ):const BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageStreamBuilder extends StatelessWidget {
  const MessageStreamBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _fireStore.collection('massege').orderBy('time').snapshots(),
        builder: (context, snapshot) {
          List<MessageLine> messageWidgets = [];
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.purple,
              ),
            );
          }
          final messages = snapshot.data!.docs.reversed;
          for (var message in messages) {
            final messageText = message.get('text');
            final messageSender = message.get('sender'); //email user sent data
            final currentUser = sinInUser.email; //email user open now

            final messageWidget = MessageLine(
              isMe: currentUser==messageSender,
              messageText: messageText,
              messageSender: messageSender,
            );
            messageWidgets.add(messageWidget);
          }

          return Expanded(
            child: ListView(
              reverse: true,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              children: messageWidgets,
            ),
          );
        });
  }
}
