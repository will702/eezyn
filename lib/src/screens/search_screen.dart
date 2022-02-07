import 'package:flutter/material.dart';
import 'package:new_flutter_template/src/colors_themes/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> searchData = [];
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  void addSerchData() async {
    if (_controller.text.trim().isEmpty) {
      _clearList();
      return;
    }
    if (searchData.isNotEmpty) {
      _clearList();
    }
    for (int i = 0; i < 10; i++) {
      Future.delayed(Duration(milliseconds: 100 * i), (() {
        searchData.insert(i, _controller.text);
        _listKey.currentState?.insertItem(i);
      }));
    }
  }

  void _clearList() {
    for (int i = 0; i < searchData.length; i++) {
      _listKey.currentState
          ?.removeItem(0, (context, animation) => const SizedBox.shrink());
    }
    searchData.clear();
  }

  void _onChanged() {
    if (_controller.text.trim().isEmpty) {
      _clearList();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 180,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: textColor(context).withAlpha(25),
                height: 50,
                child: const Text("ADD"),
                alignment: Alignment.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) => _onChanged(),
                onSubmitted: (value) => addSerchData(),
                controller: _controller,
                decoration: InputDecoration(
                    hintText: "search",
                    prefixIcon: Icon(
                      Icons.search,
                      color: homeAppBarColor(context),
                    ),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide:
                            BorderSide(color: homeAppBarColor(context)))),
              ),
            ),
          ],
        ),
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: 0,
        itemBuilder: (context, index, animation) {
          return ScaleTransition(
            scale: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                      begin: const Offset(0, .5), end: const Offset(0, 0))
                  .chain(CurveTween(curve: Curves.easeIn))
                  .animate(animation),
              child: Card(
                color: Colors.primaries[index],
                child: ListTile(
                  style: ListTileStyle.list,
                  title: Text(searchData[index]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
