import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_clone/Widget/bottom_nav.dart';
import 'package:youtube_clone/list_data.dart';
import 'package:timeago/timeago.dart' as timeago;

class VideoItem extends StatelessWidget {
  final Video video;
  final VoidCallback? callback;
  const VideoItem({Key? key, required this.video, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        context.read(selectedVideoProvider).state = video;
        context
            .read(miniPlayerControllerProvider)
            .state
            .animateToHeight(state: PanelState.MAX);
        if (callback != null) {
          callback!();
        }
      }),
      child: new Column(
        children: [
          new Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
                child: Image.network(video.thumbnailUrl,
                    height: 200.0, width: double.infinity, fit: BoxFit.cover),
              ),
              new Positioned(
                bottom: 8.0,
                right: 8.0,
                child: new Container(
                  color: Colors.black,
                  child: new Text(
                    video.duration,
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.white),
                  ),
                  padding: EdgeInsets.all(4.0),
                ),
              )
            ],
          ),
          new Padding(
            padding: EdgeInsets.all(8),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new GestureDetector(
                  onTap: (() => {}),
                  child: new CircleAvatar(
                    foregroundImage: new NetworkImage(
                      video.author.profileImageUrl,
                    ),
                  ),
                ),
                new SizedBox(width: 8.0),
                new Expanded(
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Flexible(
                        child: new Text(
                          video.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 15),
                        ),
                      ),
                      new Flexible(
                        child: new Text(
                          "${video.author.username} • ${video.viewCount} views • ${timeago.format(video.timestamp)} ",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
                new GestureDetector(
                    onTap: (() {}), child: new Icon(Icons.more_vert, size: 20))
              ],
            ),
          )
        ],
      ),
    );
  }
}
