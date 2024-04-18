import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../entites/home/slider_entity.dart';
import '../../repository/home/get_slider_repository.dart';


class GetSliderUseCase {
  final GetSliderRepository _getSliderRepository;
  GetSliderUseCase(this._getSliderRepository);

  Future<Either<Failure, List<SliderEntity>>> excute({var withReleaseType,var releaseDateGte ,var releaseDateLte,var withoutGenres,var voteCountGte,String ?sortBy}) async {
    return await _getSliderRepository.getSlider(releaseDateGte: releaseDateGte,releaseDateLte: releaseDateLte,withReleaseType: withReleaseType,withoutGenres: withoutGenres,voteCountGte: voteCountGte,sortBy: sortBy);
  }
}