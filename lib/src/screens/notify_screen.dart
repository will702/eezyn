import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:new_flutter_template/src/colors_themes/colors.dart';
import 'package:new_flutter_template/src/utils/utils.dart';

class NotifyScreen extends StatelessWidget {
  const NotifyScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.notification_important),
                  label: const Text("Notify all"),
                  style: ElevatedButton.styleFrom(
                    primary: homeAppBarColor(context),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: getWidth(context) > 600 ? 2 : 1,
              childAspectRatio: 3,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: OpenContainer(
                  openElevation: 0,
                  closedElevation: 0,
                  closedColor: cardColor(context),
                  openBuilder: (context, action) {
                    return MessageOpenedContent(
                      message: Text("message ${index + 1}" * 20),
                    );
                  },
                  closedBuilder: (context, action) {
                    return ListTile(
                      title: Text("Messege ${index + 1}"),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class MessageOpenedContent extends StatelessWidget {
  const MessageOpenedContent({
    Key? key,
    required this.message,
  }) : super(key: key);
  final Widget message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Message notify"),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.message),
                          label: const Text("NOTIFY"),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.black12,
                            height: 40,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: message,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
