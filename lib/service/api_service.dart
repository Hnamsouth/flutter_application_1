import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/entities_youtube/channel_model.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

String key = "AIzaSyAsLvIYVPFXJoABkBgBiFWD85c5HmNw5bA";

@RestApi(baseUrl: "https://www.googleapis.com/youtube/v3/")
abstract class RestClient{
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("channels")
  Future<List<Channel>> getCurrentChannel(
    @Query("key") String key,
    @Query("part") String part,
    @Query("forHandle") String forHandle
    );

  @GET("search")
  Future<List<Channel>> searchChannel(
    @Query("q") String query
    );
}