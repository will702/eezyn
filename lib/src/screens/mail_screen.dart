import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:new_flutter_template/src/colors_themes/colors.dart';

import 'open_mail_screen.dart';

class MailScreen extends StatefulWidget {
  const MailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MailScreen> createState() => _MailScreenState();
}

class _MailScreenState extends State<MailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
        labelColor: textColor(context),
        tabs: const [
          Tab(text: "Inbox"),
          Tab(text: "New"),
          Tab(text: "Search"),
        ],
        controller: _tabController,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(
            itemCount: 16,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: OpenContainer(
                  middleColor: homeAppBarColor(context),
                  closedColor: cardColor(context),
                  openElevation: 0,
                  closedElevation: 0,
                  closedBuilder: (context, action) {
                    return ListTile(
                      title: Text(
                        "Mail ${index + 1}",
                        style: TextStyle(color: textColor(context)),
                      ),
                    );
                  },
                  openBuilder: (context, action) {
                    return OpenedMailContent(title: "Mail ${index + 1}");
                  },
                ),
              );
            },
          ),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
