import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_clone/Screens/video_screen.dart';
import '../Screens/add_videos.dart';
import '../Screens/home.dart';
import '../Screens/library.dart';
import '../Screens/shorts.dart';
import '../Screens/subscriptions.dart';
import '../list_data.dart';

final selectedVideoProvider = StateProvider<Video?>((ref) => null);
final miniPlayerControllerProvider =
    StateProvider.autoDispose<MiniplayerController>(
  (ref) => MiniplayerController(),
);

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _clickedIndex = 0;
  final _screens = [
    new HomeScreen(),
    new ShortsScreen(),
    new AddScreen(),
    new SubsriptionsScreen(),
    new LibraryScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Consumer(builder: ((context, watch, child) {
        final selVideo = watch(selectedVideoProvider).state;
        final miniplayerController = watch(miniPlayerControllerProvider).state;
        return new Stack(
          children: _screens
              .asMap()
              .map((key, val) => new MapEntry(
                  key,
                  new Offstage(
                    offstage: _clickedIndex != key,
                    child: val,
                  )))
              .values
              .toList()
            ..add(new Offstage(
                offstage: selVideo == null,
                child: new Miniplayer(
                    controller: miniplayerController,
                    minHeight: 60,
                    maxHeight: MediaQuery.of(context).size.height,
                    builder: (height, percent) {
                      if (selVideo == null) return new SizedBox.shrink();
                      if (height <= 60.0 + 50.0) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  selVideo.thumbnailUrl,
                                  height: 60 - 4.0,
                                  width: 120.0,
                                  fit: BoxFit.cover,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            selVideo.title,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            selVideo.author.username,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.play_arrow),
                                  onPressed: () {},
                                ),
                                new IconButton(
                                  icon: const Icon(Icons.close),
                                  onPressed: () {
                                    context.read(selectedVideoProvider).state =
                                        null;
                                  },
                                ),
                              ],
                            ),
                            new LinearProgressIndicator(
                              minHeight: 2,
                              value: 0.7,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.red,
                              ),
                            ),
                          ],
                        );
                      }
                      return VideoScreen();
                    }))),
        );
      })),
      bottomNavigationBar: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _clickedIndex,
          onTap: (i) {
            setState(() {
              _clickedIndex = i;
            });
          },
          selectedFontSize: 10,
          unselectedFontSize: 10,
          items: [
            new BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home_filled),
                label: "Home"),
            new BottomNavigationBarItem(
                icon: Icon(Icons.video_file_outlined),
                activeIcon: Icon(Icons.video_file),
                label: "Shorts"),
            new BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline),
                activeIcon: Icon(Icons.add_circle),
                label: "Add"),
            new BottomNavigationBarItem(
                icon: Icon(Icons.subscriptions_outlined),
                activeIcon: Icon(Icons.subscriptions),
                label: "Subscriptions"),
            new BottomNavigationBarItem(
                icon: Icon(Icons.video_library_outlined),
                activeIcon: Icon(Icons.video_library),
                label: "Library"),
          ]),
    );
  }
}
