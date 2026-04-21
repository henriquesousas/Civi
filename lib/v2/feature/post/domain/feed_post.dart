class FeedPost {
  final String author;
  final String title;
  final String timeAgo;
  final String location;
  final String distance;
  final String description;
  final String views;
  final int videos;
  final int audios;
  final int comments;
  final String imageUrl;
  final bool isVideo;
  final bool showCarouselDots;

  FeedPost({
    required this.author,
    required this.title,
    required this.timeAgo,
    required this.location,
    required this.distance,
    required this.description,
    required this.views,
    required this.videos,
    required this.audios,
    required this.comments,
    required this.imageUrl,
    required this.isVideo,
    required this.showCarouselDots,
  });
}
