import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/modules/Home/bloc/home_cubit/states.dart';

import '../../../../core/error/server_failure.dart';
import '../../../../core/serivces/web_service.dart';
import '../../data/data_sources/home/get_categories_data_source.dart';
import '../../data/repository_imp/home/get_categories_repository_imp.dart';
import '../../domain/entites/home/slider_entity.dart';
import '../../domain/repository/home/get_slider_repository.dart';
import '../../domain/use_cases/home/get_slider_use_case.dart';

class SliderCubit extends Cubit<SliderStates> {
  SliderCubit() : super(SliderInitStates());

  static SliderCubit get(context) => BlocProvider.of(context);

  WebServices _services = WebServices();

  late GetSliderUseCase _getSliderUseCase;
  late GetSliderRepository _sliderRepository;
  late GetSliderDataSource _sliderDataSource;

  List<SliderEntity> _sliderList = [];
  List<SliderEntity> _newRealeasesList = [];
  List<SliderEntity> _newRecommendedList = [];
  List<SliderEntity> get categoriesList => _sliderList;
  List<SliderEntity> get newRealeasesListList => _newRealeasesList;
  List<SliderEntity> get newRecommendedList => _newRecommendedList;

  Future<void> getSlider() async {
    emit(SliderLoadingStates());
    _sliderDataSource = GetSliderDataSource(_services.freeDio);
    _sliderRepository = GetSliderRepositoryImp(_sliderDataSource);
    _getSliderUseCase = GetSliderUseCase(_sliderRepository);
    var result = await _getSliderUseCase.excute();

    return result.fold(
      (fail) {
        var error = fail as ServerFailure;
        emit(SliderErrorStates());
      },
      (data) {
        _sliderList = data;
        emit(SliderSuccessStates());
        getRealeasesList();
      },
    );
  }

  Future<void> getRealeasesList() async {
    emit(SliderLoadingStates());

    _sliderDataSource = GetSliderDataSource(_services.freeDio);
    _sliderRepository = GetSliderRepositoryImp(_sliderDataSource);
    _getSliderUseCase = GetSliderUseCase(_sliderRepository);
    var result = await _getSliderUseCase.excute(
        withReleaseType: "2|3",
        releaseDateGte: " {min_date}",
        releaseDateLte: "{max_date}");

    return result.fold(
      (fail) {
        var error = fail as ServerFailure;
        emit(SliderErrorStates());
      },
      (data) {
        print("getRealeasesList" + data[0].id.toString());
        _newRealeasesList = data;

        emit(SliderSuccessStates());
        getRecommendedList();

      },
    );
  }


  Future<void> getRecommendedList() async {
    emit(SliderLoadingStates());

    _sliderDataSource = GetSliderDataSource(_services.freeDio);
    _sliderRepository = GetSliderRepositoryImp(_sliderDataSource);
    _getSliderUseCase = GetSliderUseCase(_sliderRepository);
    var result = await _getSliderUseCase.excute(
 sortBy: "vote_average.desc",voteCountGte:"200" ,withoutGenres:" 99,10755",);

    return result.fold(
      (fail) {
        var error = fail as ServerFailure;
        emit(SliderErrorStates());
      },
      (data) {
        print("getRecommendedList${data[0].id}");
        _newRecommendedList = data;
        emit(SliderSuccessStates());
      },
    );
  }
}
