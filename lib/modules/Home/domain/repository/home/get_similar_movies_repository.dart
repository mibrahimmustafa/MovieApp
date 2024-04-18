import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../entites/home/slider_entity.dart';

abstract class GetSimilarMoviesRepository {

  Future<Either<Failure, List<SliderEntity>>> getSimilarMovies({int ?id});
}