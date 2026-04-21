import 'package:deehelp/v2/feature/post/domain/feed_post.dart';

final List<FeedPost> posts = [
  FeedPost(
    author: 'Nationwide',
    title: 'Escaped Prisoner Near Playground',
    timeAgo: '3 hours',
    location: 'Corona, New York',
    distance: '4766.5 mi',
    description:
        'Police are actively searching for an escaped prisoner in Corona, New York, last seen wearing an orange outfit.',
    views: '30.2K',
    videos: 3,
    audios: 2,
    comments: 82,
    imageUrl:
        'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?q=80&w=1200&auto=format&fit=crop',
    isVideo: true,
    showCarouselDots: true,
  ),
  FeedPost(
    author: 'newyorkUser2253570007',
    title: 'Fire on 16th Floor of Building',
    timeAgo: '2 hours',
    location: 'New York, New York',
    distance: '4771.7 mi',
    description:
        'Firefighters responded to a fire on the 16th floor of a building at 2400 2nd Ave in New York, with reports of smoke and road blockage in the area.',
    views: '17.5K',
    videos: 12,
    audios: 4,
    comments: 30,
    imageUrl:
        'https://images.unsplash.com/photo-1519003722824-194d4455a60c?q=80&w=1200&auto=format&fit=crop',
    isVideo: false,
    showCarouselDots: false,
  ),
  FeedPost(
    author: 'communityReporter',
    title: 'Road Blocked After Crash',
    timeAgo: '1 hour',
    location: 'Brooklyn, New York',
    distance: '4770.1 mi',
    description:
        'Traffic is being diverted after a collision involving two vehicles. Avoid the area and use alternative routes.',
    views: '9.3K',
    videos: 1,
    audios: 0,
    comments: 14,
    imageUrl:
        'https://images.unsplash.com/photo-1503376780353-7e6692767b70?q=80&w=1200&auto=format&fit=crop',
    isVideo: false,
    showCarouselDots: false,
  ),
];
