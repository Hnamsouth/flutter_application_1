

import 'package:flutter_application_1/model/entity/channel_model.dart';
import 'package:flutter_application_1/model/entity/channel_subcription.dart';
import 'package:flutter_application_1/model/entity/video_model.dart';
import 'package:flutter_application_1/presentation/nav/screen_type.dart';

final List<Topic> topicsData= [
  Topic(id: 0, name: "All"),
  Topic(id: 1, name: "Gaming"),
  Topic(id: 2, name: "Live"),
  Topic(id: 3, name: "Music"),
  Topic(id: 4, name: "News"),
  Topic(id: 5, name: "Movies"),
  Topic(id: 6, name: "Fashion"),
  Topic(id: 7, name: "Learning"),
];

final List<String> videoIds = [
  'tcodrIK2P_I',
  'H5v3kku4y6Q',
  'nPt8bK2gbaU',
  'K18cpp_-gP8',
  'iLnmTe5Q2Qw',
  '_WoCV4c6XOE',
  'KmzdUe0RSJo',
  '6jZDSSZZxjQ',
  'p2lYr3vM_1w',
  '7QUtEmBT_-w',
  '34_PXCzGw1M'
];


final List<Video> videosData = [
  Video(
    id: 1,
    title: "BUỒN HAY VUI - VSOUL x MCK x Obito x Ronboogz x Boyzed (Official Audio)",
    description: "Description 1",
    thumbnailUrl: "assets/images/buon-hay-vui.jpg",
    videoUrl: "assets/videos/buon-hay-vui-0.mp4",
    channelTitle: "Channel 1",
    viewCount: 10000000,
    likeCount: 500,
    dislikeCount: 50,
    commentCount: 200,
    publishedAt: "1 day ago",
    topics:  [topicsData[3]],
    channel: channelsData[0],
  ),
  Video(
    id:2,
    title: "Big Buck Bunny",
    description: "Description 2",
    thumbnailUrl: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
    videoUrl: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    channelTitle: "Channel 2",
    viewCount: 2000,
    likeCount: 1000,
    dislikeCount: 100,
    commentCount: 300,
    publishedAt: "2 year ago",
    topics: [topicsData[4], topicsData[1]],
    channel: channelsData[0],
  ),
  Video(
    id:3,
    title: "Elephant Dream",
    description: "Description 2",
    thumbnailUrl:  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg",
    videoUrl:  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
    channelTitle: "Channel 2",
    viewCount: 2000,
    likeCount: 1000,
    dislikeCount: 100,
    commentCount: 300,
    publishedAt: "4 month ago",
    topics: [topicsData[5], topicsData[6]],
    channel: channelsData[1],
  ),
  Video(
    id:4,
    title:  "For Bigger Blazes",
    description: "Description 2",
    thumbnailUrl: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerBlazes.jpg",
    videoUrl: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
    channelTitle: "Channel 2",
    viewCount: 2000,
    likeCount: 1000,
    dislikeCount: 100,
    commentCount: 300,
    publishedAt: "5 week ago",
    topics: [topicsData[7]],
    channel: channelsData[1],
  ),
  Video(
    id:5,
    title: "For Bigger Escape",
    description: "Description 2",
    thumbnailUrl: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerEscapes.jpg",
    videoUrl: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
    channelTitle: "Channel 2",
    viewCount: 2000,
    likeCount: 1000,
    dislikeCount: 100,
    commentCount: 300,
    publishedAt: "10 day ago",
    topics: [topicsData[1], topicsData[2]],
    channel: channelsData[2],
  ),
  Video(
    id:2,
    title: "For Bigger Fun",
    description: "Description 2",
    thumbnailUrl:"http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerFun.jpg",
    videoUrl: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
    channelTitle: "Channel 2",
    viewCount: 2000,
    likeCount: 1000,
    dislikeCount: 100,
    commentCount: 300,
    publishedAt: "23 day ago",
    topics: [topicsData[5]],
    channel: channelsData[2],
  ),
];


final List<Channel> channelsData = [
  Channel(
    id: 1,
    name: "Channel 1",
    description: "Description 1",
    subscribers: 1000000,
    imageUrl: "https://robohash.org/Terry.png?set=set5",
  ),
  Channel(
    id: 2,
    name: "Channel 2",
    description: "Description 2",
    subscribers: 2000000,
    imageUrl: "https://robohash.org/Sheldon.png?set=set5",
  ),
    Channel(
    id: 3,
    name: "Channel 3",
    description: "Description 3",
    subscribers: 2000000,
    imageUrl: "https://robohash.org/Terrill.png?set=set5",
  ),
   Channel(
    id: 4,
    name: "Channel 4",
    description: "Description 3",
    subscribers: 2000000,
    imageUrl: "https://robohash.org/Sheldon.png?set=set6",
  ),
   Channel(
    id: 5,
    name: "Channel 5",
    description: "Description 3",
    subscribers: 2000000,
    imageUrl: "https://robohash.org/Terry.png?set=set6",
  ),
   Channel(
    id: 6,
    name: "Channel 6",
    description: "Description 3",
    subscribers: 2000000,
    imageUrl: "https://robohash.org/Sheldon.png?set=set6",
  ),
];

final Channel currentChannel = Channel(
  id: 0,
  name: "South",
  description: "Description 1",
  subscribers: 1000000000,
  imageUrl: "https://robohash.org/Sheldon.png?set=set5",
  subscriptions:channelsData
);


final List<ChannelSubcription> channelSubcription = [
  ChannelSubcription(
    id: 1,
    channel: currentChannel,
    subscribed: channelsData[0],
    status:ChannelStatus.STREAMING.index
  ),
  ChannelSubcription(
    id: 2,
    channel: currentChannel,
    subscribed: channelsData[1],
    status:ChannelStatus.NEWVIDEOWATCHED.index
  ),
  ChannelSubcription(
    id: 3,
    channel: currentChannel,
    subscribed: channelsData[2],
    status:ChannelStatus.NEWVIDEOWATCHED.index
  ),
  ChannelSubcription(
    id: 4,
    channel: currentChannel,
    subscribed: channelsData[3],
    status:ChannelStatus.NONE.index
  ),
  ChannelSubcription(
    id: 5,
    channel: currentChannel,
    subscribed: channelsData[4],
    status:ChannelStatus.NONE.index
  ),
  ChannelSubcription(
    id: 6,
    channel: currentChannel,
    subscribed: channelsData[5],
    status:ChannelStatus.NONE.index
  ),
];