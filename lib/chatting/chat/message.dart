import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eos_chatting/chatting/chat/chat_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // TODO : 현재 유저 정보 받기
    final user = FirebaseAuth.instance.currentUser;
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('chat')
          // TODO : time을 기준으로 ordering, descending : true
          .orderBy('time', descending: true)
          .snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final docs = snapshot.data!.docs;
        return ListView.builder(
            reverse: true,
            itemCount: docs.length,
            itemBuilder: (context, index) {
              return ChatBubble(
              // TODO : text, userId가 내 아이디랑 같은지, username을 보내야함
                docs[index]['text'],
                docs[index]['userId'] == user!.uid ? true : false,
                docs[index]['userName'],
              );
            });
      },
    );
  }
}