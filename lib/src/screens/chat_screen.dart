import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:new_flutter_template/src/screens/chat_contact_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              height: 60,
              color: Colors.black12,
              child: const Text("ADD"),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(4.0),
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ListTile(
                    onTap: () => Navigator.of(context).push(
                      PageRouteBuilder(transitionsBuilder:
                          ((context, animation, secondaryAnimation, child) {
                        return FadeThroughTransition(
                          animation: animation,
                          secondaryAnimation: secondaryAnimation,
                          child: child,
                        );
                      }), pageBuilder:
                          (context, animation, secondaryAnimation) {
                        return ChatContactScreen(
                          contactName: "Contact ${index + 1}",
                          image: Image.asset("assets/images/default_user.jpg")
                              .image,
                        );
                      }),
                    ),
                    leading: CircleAvatar(
                      foregroundImage:
                          Image.asset("assets/images/default_user.jpg").image,
                    ),
                    title: Text("Contact ${index + 1}"),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
