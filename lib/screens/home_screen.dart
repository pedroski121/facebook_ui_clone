import 'package:facebook_ui_clone/data/data.dart';
import 'package:flutter/material.dart';
import 'package:facebook_ui_clone/config/palette.dart';
import 'package:facebook_ui_clone/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:facebook_ui_clone/models/models.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text(
            'facebook',
            style: const TextStyle(
                color: Palette.facebookBlue,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2),
          ),
          floating: true,
          actions: [
            // a list of widgets at the right side of the bar
            CircleButton(
              icon: Icons.search,
              iconSize: 30.0,
              onPressed: () => print('Search'),
            ),
            CircleButton(
              icon: MdiIcons.facebookMessenger,
              iconSize: 30.0,
              onPressed: () => print('Messenger'),
            ),
          ],
        ),
        SliverToBoxAdapter(
            child: CreatePostContainer(
          currentUser: currentUser,
        )),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Rooms(onlineUsers: onlineUsers),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Stories(
              currentUser: currentUser,
              stories: stories,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final Post post = posts[index];
            return PostContainer(post:post);
          },
            childCount: posts.length
          ),

        )
      ],
    ));
  }
}
