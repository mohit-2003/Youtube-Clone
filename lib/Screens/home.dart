import 'package:flutter/material.dart';
import 'package:youtube_clone/Widget/sliver_app_bar.dart';
import 'package:youtube_clone/list_data.dart';

import '../Widget/video_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new CustomScrollView(
      slivers: [
        new MySliverAppBar(),
        SliverPadding(
          padding: new EdgeInsets.only(bottom: 60),
          sliver: new SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            final videoItem = videos[index];
            return new VideoItem(video: videoItem);
          }, childCount: 3)),
        )
      ],
    ));
  }
}
