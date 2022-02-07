import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:new_flutter_template/src/colors_themes/colors.dart';
import 'package:new_flutter_template/src/utils/utils.dart';

class ChatContactScreen extends StatefulWidget {
  const ChatContactScreen(
      {Key? key, required this.contactName, required this.image})
      : super(key: key);
  final String contactName;
  final ImageProvider image;

  @override
  State<ChatContactScreen> createState() => _ChatContactScreenState();
}

class _ChatContactScreenState extends State<ChatContactScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.addListener(listener);
    super.initState();
  }

  void listener() {
    log(_controller.text);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appBarColor(context),
        title: Row(
          children: [
            CircleAvatar(foregroundImage: widget.image),
            const SizedBox(width: 12),
            Text(widget.contactName)
          ],
        ),
      ),
      floatingActionButton: BottomBar(
        controller: _controller,
        listener: listener,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView.custom(childrenDelegate: SliverChildListDelegate([])),
    );
  }
}

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key, required this.controller, required this.listener})
      : super(key: key);
  final TextEditingController controller;
  final VoidCallback listener;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  IconData icon = Icons.send;
  void onChange(String text) {
    if (text.isNotEmpty && icon != Icons.send) {
      icon = Icons.send;
      setState(() {});
    } else if (text.isEmpty && icon != Icons.mic) {
      icon = Icons.mic;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        //color: Colors.black12,
        child: Stack(
          children: [
            Positioned(
              child: TextField(
                onChanged: (value) => onChange(value),
                controller: widget.controller,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  hintText: "Message",
                  contentPadding: const EdgeInsets.only(top: 16.0),
                  prefixIcon: Icon(Icons.face, color: textColor(context)),
                  fillColor: textFieldColor(context),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
              left: 8,
              bottom: 0,
              top: 0,
              width: getWidth(context) - 100,
            ),
            Positioned(
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.green.shade900,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Icon(
                    icon,
                    key: UniqueKey(),
                    color: Colors.white,
                  ),
                ),
              ),
              right: 8,
              bottom: 0,
              top: 0,
            )
          ],
        ),
      ),
    );
  }
}
