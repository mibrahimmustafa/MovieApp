import 'package:dartz/dartz.dart';



import '../../../../../core/error/failure.dart';
import '../../../../../core/error/server_failure.dart';
import '../../../../../core/models/home_models/slider_model/slider_model.dart';
import '../../../domain/entites/home/slider_entity.dart';

import '../../../domain/repository/home/get_similar_movies_repository.dart';
import '../../data_sources/home/get_similar_movies_data_source.dart';

class GetSimilarMoviesRepositoryImp extends GetSimilarMoviesRepository {
  final GetSimilarMoviesDataSource _getSimilarMoviesDataSource;

  GetSimilarMoviesRepositoryImp(this._getSimilarMoviesDataSource);

  @override
  Future<Either<Failure, List<SliderEntity>>> getSimilarMovies({int ?id}) async {
    var response = await _getSimilarMoviesDataSource.getSimilarMovies(id: id);

    if (response.statusCode == 200) {

      List<SliderEntity> list = [];


      for (var element in (response.data["results"] as List)) {
          list.add(Result.fromJson(element));
        }

      return Right(list);
    } else {
      return Left(
        ServerFailure(
          statusCode: response.statusCode.toString(),
        ),
      );
    }
  }
}
