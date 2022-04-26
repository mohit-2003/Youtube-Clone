class User {
  final String username;
  final String profileImageUrl;
  final String subscribers;

  const User({
    required this.username,
    required this.profileImageUrl,
    required this.subscribers,
  });
}

const User currentUser = User(
  username: 'Mohit Kumar',
  profileImageUrl: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
  subscribers: '1M',
);

class Video {
  final String id;
  final User author;
  final String title;
  final String thumbnailUrl;
  final String duration;
  final DateTime timestamp;
  final String viewCount;
  final String likes;
  final String dislikes;
  final String comments;

  const Video(
      {required this.id,
      required this.author,
      required this.title,
      required this.thumbnailUrl,
      required this.duration,
      required this.timestamp,
      required this.viewCount,
      required this.likes,
      required this.dislikes,
      required this.comments});
}

final List<Video> videos = [
  Video(
      id: 'x606y4QWrxo',
      author: currentUser,
      title: 'Sample Video - 1 | Flutter Youtube Clone UI',
      thumbnailUrl: 'https://i.ytimg.com/vi/RrH0Hi_12R0/hq720.jpg',
      duration: '4:20',
      timestamp: DateTime(2022, 3, 18),
      viewCount: '102K',
      likes: '9K',
      dislikes: '100',
      comments: "39"),
  Video(
      author: currentUser,
      id: 'vrPk6LB9bjo',
      title: 'Sample Video - 2 | Flutter Youtube Clone UI',
      thumbnailUrl: 'https://i.ytimg.com/vi/oPsfhgz3M10/hq720.jpg',
      duration: '28:06',
      timestamp: DateTime(2021, 11, 12),
      viewCount: '4M',
      likes: '48K',
      dislikes: '8K',
      comments: "15K"),
  Video(
      id: 'ilX5hnH8XoI',
      author: currentUser,
      title: 'Sample Video - 3 | Flutter Youtube Clone UI',
      thumbnailUrl: 'https://i.ytimg.com/vi/6d2wzfx4sRs/hq720.jpg',
      duration: '12:01',
      timestamp: DateTime(2021, 07, 05),
      viewCount: '118K',
      likes: '1k',
      dislikes: '4',
      comments: "48"),
];

final List<Video> suggestedVideos = [
  Video(
      id: 'rJKN_880b-M',
      author: currentUser,
      title: 'Suggested Sample Video - 1 | Flutter Youtube Clone UI',
      thumbnailUrl: 'https://i.ytimg.com/vi/i2-tuXNtup0/hqdefault.jpg',
      duration: '13:05',
      timestamp: DateTime(2021, 8, 22),
      viewCount: '854K',
      likes: '81k',
      dislikes: '7K',
      comments: "12K"),
  Video(
      id: 'HvLb5gdUfDE',
      author: currentUser,
      title: 'Suggested Sample Video - 2 | Flutter Youtube Clone UI',
      thumbnailUrl: 'https://i.ytimg.com/vi/h3sxUR6i8tc/hq720.jpg',
      duration: '1:52:12',
      timestamp: DateTime(2021, 8, 7),
      viewCount: '12M',
      likes: '93K',
      dislikes: '45',
      comments: "9K"),
  Video(
      id: 'h-igXZCCrrc',
      author: currentUser,
      title: 'Suggested Sample Video - 3 | Flutter Youtube Clone UI',
      thumbnailUrl: 'https://i.ytimg.com/vi/afV7FP_1wbk/hq720.jpg',
      duration: '1:12',
      timestamp: DateTime(2020, 10, 17),
      viewCount: '358K',
      likes: '20k',
      dislikes: '1.5K',
      comments: "39K"),
];
