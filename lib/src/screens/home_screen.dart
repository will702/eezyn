import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:lottie/lottie.dart';
import 'package:new_flutter_template/src/colors_themes/colors.dart';

import 'chat_screen.dart';
import 'games_screen.dart';
import 'mail_screen.dart';
import 'notify_screen.dart';
import 'pay_screen.dart';
import 'rewards_screen.dart';
import 'search_screen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _index = 0;

  @override
  void initState() {
    _controller = TabController(length: 7, vsync: this);

    super.initState();
  }

  List<Widget> screens = [
    Container(
      child: Lottie.asset("assets/lotties/work.json"),
      alignment: Alignment.center,
    ),
    Container(
      child: Lottie.asset("assets/lotties/work.json"),
      alignment: Alignment.center,
    ),
    Container(
      child: Lottie.asset("assets/lotties/work.json"),
      alignment: Alignment.center,
    ),
    Container(
      child: Lottie.asset("assets/lotties/work.json"),
      alignment: Alignment.center,
    ),
  ];

  void switchScreen(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      backgroundColor: scaffoldBackground(context),
      bottomNavigationBar: BottomBar(
        switcher: switchScreen,
      ),
      appBar: AppBar(
        backgroundColor: homeAppBarColor(context),
        title: const Text("Eezyn"),
        //automaticallyImplyLeading: false,
        bottom: _index == 0
            ? TabBar(
                unselectedLabelColor: Colors.grey,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.white,
                isScrollable: true,
                controller: _controller,
                tabs: const [
                  Tab(text: "NOTIFY"),
                  Tab(text: "REWARDS"),
                  Tab(text: "MAIL"),
                  Tab(text: "CHAT"),
                  Tab(text: "PAY"),
                  Tab(text: "SEARCH"),
                  Tab(text: "GAMES"),
                ],
              )
            : null,
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (child, animation) {
          return FadeScaleTransition(
            animation: animation,
            child: child,
          );
        },
        child: _index == 0
            ? TabBarView(
                controller: _controller,
                children: const [
                  NotifyScreen(),
                  RewardsScreen(),
                  MailScreen(),
                  ChatScreen(),
                  PayScreen(),
                  SearchScreen(),
                  GamesScreen()
                ],
              )
            : _index == 1
                ? Container(
                    child:
                        Lottie.asset("assets/lotties/work.json", animate: true),
                    alignment: Alignment.center,
                  )
                : _index == 2
                    ? Container(
                        child: Lottie.asset("assets/lotties/work.json"),
                        alignment: Alignment.center,
                      )
                    : Container(
                        child: Lottie.asset("assets/lotties/work.json"),
                        alignment: Alignment.center,
                      ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Lottie.asset("assets/lotties/avatar.json"),
          ),
          const ListTile(
            title: Text("Help"),
            leading: Icon(Icons.help),
          ),
          const ListTile(
            title: Text("Phone"),
            leading: Icon(Icons.phone),
          ),
          const ListTile(
            title: Text("Currency"),
            leading: Icon(Icons.monetization_on_outlined),
          ),
        ],
      ),
    );
  }
}

typedef IntCallback = Function(int index);

class BottomBar extends StatefulWidget {
  const BottomBar({
    Key? key,
    required this.switcher,
  }) : super(key: key);

  final IntCallback switcher;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: Colors.white,
      currentIndex: index,
      onTap: (value) {
        setState(() {
          index = value;
        });
        widget.switcher(index);
      },
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: "HOME",
          backgroundColor: primary(context),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.photo),
          label: "PICTURE",
          backgroundColor: primary(context),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.shopping_bag),
          label: "SHOP",
          backgroundColor: primary(context),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.place_outlined),
          label: "PLACE",
          backgroundColor: primary(context),
        ),
      ],
      type: BottomNavigationBarType.shifting,
    );
  }
}
