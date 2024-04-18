import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/models/home_models/movie_details_model/movie_details_model.dart';
import '../../repository/home/get_movie_details_repository.dart';


class GetMovieDetailsUseCase {
  final GetMovieDetailsRepository _getMovieDetailsRepository;
  GetMovieDetailsUseCase(this._getMovieDetailsRepository);

  Future<Either<Failure, MovieDetailsModel>> excute({int?id}) async {
    return await _getMovieDetailsRepository.getMovieDetails(id: id);
  }
}