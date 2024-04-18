import 'package:dio/dio.dart';

class GetSliderDataSource {
  final Dio _dio;

  GetSliderDataSource(this._dio);

  Future<Response> getSlider({var withReleaseType,var releaseDateGte ,var releaseDateLte,var withoutGenres,var voteCountGte,String ?sortBy}) async {
    return await _dio.get(
      "discover/movie",queryParameters: {
        "include_adult":false,
        "include_video":false,
        "language":"en-US",
        "page":1,
        "sort_by":sortBy??"popularity.desc",
      "with_release_type":withReleaseType,
      "release_date.gte":releaseDateGte,
      "release_date.lte":releaseDateLte,
      "without_genres":withoutGenres,
      "vote_count.gte":voteCountGte
    }
    );
  }
}
