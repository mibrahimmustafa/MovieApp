import 'package:dartz/dartz.dart';



import '../../../../../core/error/failure.dart';
import '../../../../../core/error/server_failure.dart';
import '../../../../../core/models/home_models/slider_model/slider_model.dart';
import '../../../domain/entites/home/slider_entity.dart';
import '../../../domain/repository/home/get_slider_repository.dart';
import '../../data_sources/home/get_categories_data_source.dart';

class GetSliderRepositoryImp extends GetSliderRepository {
  final GetSliderDataSource _getSliderDataSource;

  GetSliderRepositoryImp(this._getSliderDataSource);

  @override
  Future<Either<Failure, List<SliderEntity>>> getSlider({var withReleaseType,var releaseDateGte ,var releaseDateLte,var withoutGenres,var voteCountGte,String ?sortBy}) async {
    var response = await _getSliderDataSource.getSlider(withReleaseType: withReleaseType,releaseDateLte: releaseDateLte,releaseDateGte: releaseDateGte,sortBy: sortBy,voteCountGte: voteCountGte,withoutGenres: withoutGenres);

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
