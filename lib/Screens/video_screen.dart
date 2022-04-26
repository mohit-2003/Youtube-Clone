import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_clone/Widget/bottom_nav.dart';
import 'package:youtube_clone/Widget/video_info.dart';
import 'package:youtube_clone/Widget/video_item.dart';
import 'package:youtube_clone/list_data.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  ScrollController? _scrollController;
  final suggestedVideoList = suggestedVideos;

  @override
  void initState() {
    _scrollController = new ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    suggestedVideoList.shuffle();

    return GestureDetector(
      onTap: () => context
          .read(miniPlayerControllerProvider)
          .state
          .animateToHeight(state: PanelState.MAX),
      child: new Scaffold(
          body: new CustomScrollView(
        controller: _scrollController,
        shrinkWrap: true,
        slivers: [
          new SliverToBoxAdapter(
            child: new Consumer(
              builder: (context, watch, _) {
                final selVideo = watch(selectedVideoProvider).state;
                return new SafeArea(
                  child: new Column(children: [
                    new Stack(
                      children: [
                        Image.network(selVideo!.thumbnailUrl,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover),
                        new IconButton(
                          onPressed: () {
                            context
                                .read(miniPlayerControllerProvider)
                                .state
                                .animateToHeight(state: PanelState.MIN);
                          },
                          icon: Icon(Icons.keyboard_arrow_down),
                          iconSize: 30,
                        )
                      ],
                    ),
                    new LinearProgressIndicator(
                      value: 0.3,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.red,
                      ),
                    ),
                    new VideoInfo(video: selVideo)
                  ]),
                );
              },
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            final videoItem = suggestedVideoList[index];
            return new VideoItem(
              video: videoItem,
              callback: () => _scrollController!.animateTo(0,
                  duration: new Duration(microseconds: 200),
                  curve: Curves.easeIn),
            );
          }, childCount: suggestedVideoList.length))
        ],
      )),
    );
  }
}
