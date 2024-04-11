import 'package:dio/dio.dart';
import 'package:movie_app/models/api_model.dart';

class Client {
  final String baseUrl;
  final String apiKey;
  final Dio dio;

  Client({required this.baseUrl, required this.apiKey})
      : dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<ApiModel> getMovieDetail({required String name}) async {
    final Response<dynamic> response = await dio.get("?t=$name&apikey=$apiKey");

    return ApiModel.fromJson(response.data);
  }
}
