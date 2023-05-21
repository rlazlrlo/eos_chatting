import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(this.message, this.isMe, this.userName, {super.key});
  //TODO 1 : 변수를 final로 선언
  final message, isMe, userName;
  @override
  Widget build(BuildContext context) {
    return Row(
        // TODO 2 : 나일때는 오른쪽, 아닐때는 왼쪽
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Padding(
            // TODO 3 : 나일때랑 아닐때 나누기, padding은 5
            padding: isMe ? EdgeInsets.only(right: 5) : EdgeInsets.only(left: 5),
            // TODO 4: Column 또는 Row
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TODO 5: 내가 아닐때는 닉네임이 위에 있어야겠죠? 왼쪽에 padding 10, 색은 grey
                if (!isMe)
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(userName,
                    style: TextStyle(color: Colors.grey),
                    ),
                  ),
                Container(
                  decoration: BoxDecoration(
                    //TODO 6: 나일때는 lightGreen, 아닐때는 black12
                    color: isMe ? Colors.lightGreen : Colors.black12,
                    borderRadius: isMe ? BorderRadius.only(
                    //TODO 7: 디자인을 보고 한번 해보세요 (나일떄, 아닐때 구분하기!)),
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      ) : BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7),
                      // TODO 8: padding은 위아래 10, 좌우 16, margin은 위아래 4, 좌우 8
                      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                      margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                  // TODO 9: 색은 나일때는 흰색, 아닐때는 검은색
                  child: Text(message, style: TextStyle(color: isMe ? Colors.white : Colors.black),)
                ),
              ],
            ),
          ),
        ],
    );
  }
}