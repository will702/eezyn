import 'package:flutter/material.dart';
import 'package:new_flutter_template/src/colors_themes/colors.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: ((context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              stretch: true,
              pinned: false,
              foregroundColor: textColor(context),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 2.0,
                title: Text(
                  "Discover games",
                  style: TextStyle(color: textColor(context)),
                ),
              ),
            )
          ];
        }),
        body: ListView(
          children: [
            SizedBox(
              height: 180,
              width: double.maxFinite,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 16,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: const SizedBox(
                        height: 180,
                        width: 260,
                      ),
                      color: Colors.primaries[index].withAlpha(150),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
