part of 'api_service.dart';

class _RestClient implements RestClient {
  _RestClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://www.googleapis.com/youtube/v3/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Channel>> getCurrentChannel(
    String key,
    String part,
    String forHandle,
  ) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'key': key,
      r'part': part,
      r'forHandle': forHandle,
    };
    final headers = <String, dynamic>{};
    const Map<String, dynamic>? data = null;
    final result =
        await _dio.fetch<List<dynamic>>(_setStreamType<List<Channel>>(Options(
      method: 'GET',
      headers: headers,
      extra: extra,
    )
            .compose(
              _dio.options,
              'channels',
              queryParameters: queryParameters,
              data: data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = result.data!
        .map((dynamic i) => Channel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<Channel>> searchChannel(String query) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'q': query};
    final headers = <String, dynamic>{};
    const Map<String, dynamic>? data = null;
    final result =
        await _dio.fetch<List<dynamic>>(_setStreamType<List<Channel>>(Options(
      method: 'GET',
      headers: headers,
      extra: extra,
    )
            .compose(
              _dio.options,
              'search',
              queryParameters: queryParameters,
              data: data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = result.data!
        .map((dynamic i) => Channel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
