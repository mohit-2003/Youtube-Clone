import 'package:flutter/material.dart';

import '../list_data.dart';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new SliverAppBar(
      floating: true,
      leadingWidth: 100.0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Image.asset('assets/images/yt_icon_dark.png'),
      ),
      actions: [
        new IconButton(onPressed: () {}, icon: new Icon(Icons.cast)),
        new IconButton(
            onPressed: () {}, icon: new Icon(Icons.notifications_outlined)),
        new IconButton(onPressed: () {}, icon: new Icon(Icons.search)),
        new IconButton(
            onPressed: () {},
            icon: new CircleAvatar(
              radius: 15,
              foregroundImage: new NetworkImage(currentUser.profileImageUrl),
            ))
      ],
    );
  }
}
