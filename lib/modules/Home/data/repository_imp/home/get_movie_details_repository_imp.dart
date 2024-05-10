import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/error/server_failure.dart';
import '../../../../../core/models/home_models/movie_details_model/movie_details_model.dart';
import '../../../domain/repository/home/get_movie_details_repository.dart';
import '../../data_sources/home/get_movie_details_data_source.dart';

class GetMovieDetailsRepositoryImp extends GetMovieDetailsRepository {
  final GetMovieDetailsDataSource _getMovieDetailsDataSource;

  GetMovieDetailsRepositoryImp(this._getMovieDetailsDataSource);

  @override
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails({int? id}) async {
    var response = await _getMovieDetailsDataSource.getMovieDetails(id: id);

    if (response.statusCode == 200) {
      final MovieDetailsModel model;
      model = MovieDetailsModel.fromJson(response.data);
      return Right(model);
    } else {
      return Left(
        ServerFailure(
          statusCode: response.statusCode.toString(),
        ),
      );
    }
  }
}
