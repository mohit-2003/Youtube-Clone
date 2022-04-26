import 'package:flutter/material.dart';
import 'package:youtube_clone/list_data.dart';
import 'package:timeago/timeago.dart' as timeago;

class VideoInfo extends StatelessWidget {
  final Video video;
  const VideoInfo({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: new EdgeInsets.all(16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Row(children: [
            new Expanded(
              child: new Text(
                video.title,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 15.0),
              ),
            ),
            new Icon(
              Icons.arrow_drop_down_outlined,
            )
          ]),
          new SizedBox(height: 8.0),
          new Text(
            '${video.viewCount} views • ${timeago.format(video.timestamp)}',
            style:
                Theme.of(context).textTheme.caption!.copyWith(fontSize: 14.0),
          ),
          new SizedBox(height: 16.0),
          _ActionsRow(video: video),
          new Padding(padding: EdgeInsets.all(0), child: new Divider()),
          new Padding(
              padding: EdgeInsets.all(0),
              child: _AuthorInfo(user: video.author)),
          const Divider(),
          _commentBox(video: video)
        ],
      ),
    );
  }
}

Widget _commentBox({Video? video}) {
  return new Column(children: [
    new Row(
      children: [
        new Text("Comments", style: new TextStyle(fontSize: 14)),
        new Padding(
            padding: EdgeInsets.only(left: 8),
            child: new Text(
              video!.comments,
              style: new TextStyle(color: Colors.white38),
            )),
        new Spacer(),
        new Icon(Icons.arrow_drop_down_outlined)
      ],
    ),
    new Padding(
      padding: EdgeInsets.only(top: 8),
      child: new Row(
        children: [
          new CircleAvatar(
            radius: 12,
            foregroundImage: new NetworkImage(video.author.profileImageUrl),
          ),
          new Flexible(
            child: new Padding(
                padding: EdgeInsets.only(left: 8),
                child: new Text(video.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: new TextStyle(fontSize: 12))),
          )
        ],
      ),
    )
  ]);
}

class _ActionsRow extends StatelessWidget {
  final Video video;

  const _ActionsRow({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildAction(context, Icons.thumb_up_outlined, video.likes),
        _buildAction(context, Icons.thumb_down_outlined, "Dislike"),
        _buildAction(context, Icons.reply_outlined, 'Share'),
        _buildAction(context, Icons.file_download, 'Download'),
        _buildAction(context, Icons.library_add_outlined, 'Save'),
      ],
    );
  }

  Widget _buildAction(BuildContext context, IconData icon, String label) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const SizedBox(height: 6.0),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _AuthorInfo extends StatefulWidget {
  final User user;

  const _AuthorInfo({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<_AuthorInfo> createState() => _AuthorInfoState();
}

class _AuthorInfoState extends State<_AuthorInfo> {
  bool notificationIconVisible = false;
  bool notificationIconTaps = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          CircleAvatar(
            radius: 15,
            backgroundImage: new NetworkImage(widget.user.profileImageUrl),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    widget.user.username,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 15.0),
                  ),
                ),
                Flexible(
                  child: Text(
                    '${widget.user.subscribers} subscribers',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontSize: 14.0),
                  ),
                ),
              ],
            ),
          ),
          new TextButton(
            onPressed: () {
              setState(() {
                notificationIconVisible = !notificationIconVisible;
                notificationIconTaps = false;
              });
            },
            child: Text(
              notificationIconVisible ? "SUBSCRIBED" : "SUBSCRIBE",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: notificationIconVisible ? Colors.grey : Colors.red,
                  fontSize: 16),
            ),
          ),
          new Visibility(
            visible: notificationIconVisible,
            child: new IconButton(
              onPressed: () {
                setState(() {
                  notificationIconTaps = !notificationIconTaps;
                });
              },
              icon: new Icon(notificationIconTaps
                  ? Icons.notifications_on
                  : Icons.notifications_outlined),
            ),
          )
        ],
      ),
    );
  }
}
