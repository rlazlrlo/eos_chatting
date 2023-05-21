import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eos_chatting/config/palette.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = TextEditingController();
  var _userEnterMessage = "";

  void _sendMessage() async {
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    // TODO : FirebaseFirestore의 user collection의 user.uid를 가져오기 (마지막에 get 사용)
    final userData = await FirebaseFirestore.instance.collection('user').doc(
        user!.uid).get();
    FirebaseFirestore.instance.collection('chat').add({
      'text': _userEnterMessage,
      'time': Timestamp.now(),
      'userId': user!.uid,
      'userName': userData.data()!['userName']
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // TODO : margin은 top 8, padding은 전체 8,
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                maxLines: null,
                controller: _controller,
                decoration: InputDecoration(labelText: 'Send a messae ...'),
                onChanged: (value) {
                  // TODO : state를 바꿔줘야 합니다! - state는 위에서 적은 변수겠죠?
                  setState(() {
                    _userEnterMessage = _controller.text;
                  });
                },
              ),
            ),
            IconButton(
              //TODO : trim함수를 사용해서 아무것도 없으면 null, 있으면 _sendMessage 함수 호출
                onPressed: () {
                  _userEnterMessage
                      .trim()
                      .isNotEmpty ? _sendMessage() : null;
                },
                icon: Icon(Icons.send),
                color: Palette.eosColor)
          ],
        )
    );
  }
}