import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/models/home_models/movie_details_model/movie_details_model.dart';

abstract class GetMovieDetailsRepository {

  Future<Either<Failure, MovieDetailsModel>> getMovieDetails({int?id});
}