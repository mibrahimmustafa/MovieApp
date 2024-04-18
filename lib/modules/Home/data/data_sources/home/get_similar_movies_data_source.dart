import 'package:dio/dio.dart';

class GetSimilarMoviesDataSource {
  final Dio _dio;

  GetSimilarMoviesDataSource(this._dio);
  Future<Response> getSimilarMovies({int? id}) async {
    return await _dio.get("movie/$id/similar", queryParameters: {
      "language": "en-US",
      "page": 1,
    });
  }
}
