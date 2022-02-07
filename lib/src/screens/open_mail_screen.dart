import 'package:flutter/material.dart';

class OpenedMailContent extends StatefulWidget {
  const OpenedMailContent({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<OpenedMailContent> createState() => _OpenedMailContentState();
}

class _OpenedMailContentState extends State<OpenedMailContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(widget.title),
      ),
    );
  }
}
