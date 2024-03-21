import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/model/entities_youtube/channel_model.dart';
import 'package:flutter_application_1/model/entities_youtube/request/api_request.dart';
import 'package:flutter_application_1/model/entities_youtube/response/main_response.dart';

class ChannelProvider with ChangeNotifier {
  bool _isLoading = false;

  final String baseUrl = "https://www.googleapis.com/youtube/v3/";
  Channel _channel = Channel();
  final List<MainResponse> _channelActivities = [];
  List<MainResponse> _videos = [];
  final List<MainResponse> _subscriptions = [];

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setVideos(List<MainResponse> value) {
    _videos.addAll(value);
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  List<MainResponse> get channelActivities => _channelActivities;
  List<MainResponse> get getVideos => _videos;
  List<MainResponse> get subscriptions => _subscriptions;
  Channel get channel => _channel;

  Future<void> getMoreVideo() async {
    try {
      var response = await Dio().get(
        "https://www.googleapis.com/youtube/v3/videos?"
        "key=AIzaSyAsLvIYVPFXJoABkBgBiFWD85c5HmNw5bA"
        "&part=snippet,statistics"
        "&chart=mostPopular"
        "&maxResults=5"
        "&regionCode=US",
      );
      List<MainResponse> moreVideo = responseToListFromJson(response.data);
      setVideos(moreVideo);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> getPopularVideos() async {
    try {
      var response = await Dio().get(
        "https://www.googleapis.com/youtube/v3/videos?"
        "key=AIzaSyAsLvIYVPFXJoABkBgBiFWD85c5HmNw5bA"
        "&part=snippet,statistics"
        "&chart=mostPopular"
        "&maxResults=15"
        "&regionCode=VN",
      );
      _videos = responseToListFromJson(response.data);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> initData() async {
    final dio = Dio();
    // setIsLoading(false);
    try {
      var response = await Future.wait([
        dio.get(
          "https://www.googleapis.com/youtube/v3/videos?"
          "key=AIzaSyAsLvIYVPFXJoABkBgBiFWD85c5HmNw5bA"
          "&part=snippet,statistics"
          "&chart=mostPopular"
          "&maxResults=5"
          "&regionCode=VN",
        ),
        dio.get(
          "https://www.googleapis.com/youtube/v3/channels",
          queryParameters: ApiResquest(
            part: "snippet",
            forHandle: "@namhoang-mq2sk",
            maxResults: 1,
          ).toMap(),
        ),
      ]);
      _videos = responseToListFromJson(response[0].data);
      _channel = Channel.fromJson(response[1].data['items'][0]);
      Future.delayed(const Duration(seconds: 3));
      setIsLoading(true);
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
