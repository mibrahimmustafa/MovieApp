import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../entites/home/slider_entity.dart';
import '../../repository/home/get_similar_movies_repository.dart';
import '../../repository/home/get_slider_repository.dart';


class GetSimilarMoviesUseCase {
  final GetSimilarMoviesRepository _getSimilarMoviesRepository;
  GetSimilarMoviesUseCase(this._getSimilarMoviesRepository);

  Future<Either<Failure, List<SliderEntity>>> excute({int? id}) async {
    return await _getSimilarMoviesRepository.getSimilarMovies(id: id);
  }
}