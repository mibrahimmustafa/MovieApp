import 'package:dio/dio.dart';

class GetMovieDetailsDataSource {
  final Dio _dio;

  GetMovieDetailsDataSource(this._dio);

  Future<Response> getMovieDetails({int?id}) async {
    return await _dio.get(
      "movie/$id",

        queryParameters: {

        "language":"en-US",


    }
    );
  }
}
