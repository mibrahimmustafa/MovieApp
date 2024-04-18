import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../entites/home/slider_entity.dart';

abstract class GetSliderRepository {

  Future<Either<Failure, List<SliderEntity>>> getSlider({var withReleaseType,var releaseDateGte ,var releaseDateLte,var withoutGenres,var voteCountGte,String ?sortBy});
}