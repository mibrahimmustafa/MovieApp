import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/modules/Home/bloc/movie_details_cubit/states.dart';
import '../../../../core/error/server_failure.dart';
import '../../../../core/models/home_models/movie_details_model/movie_details_model.dart';
import '../../../../core/serivces/web_service.dart';
import '../../data/data_sources/home/get_movie_details_data_source.dart';
import '../../data/data_sources/home/get_similar_movies_data_source.dart';
import '../../data/repository_imp/home/get_movie_details_repository_imp.dart';
import '../../data/repository_imp/home/get_similar_movies_repository_imp.dart';
import '../../domain/entites/home/slider_entity.dart';
import '../../domain/repository/home/get_movie_details_repository.dart';
import '../../domain/repository/home/get_similar_movies_repository.dart';
import '../../domain/use_cases/home/get_movie_details_use_case.dart';
import '../../domain/use_cases/home/get_similar_movies_use_case.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsStates> {
  MovieDetailsCubit() : super(MovieDetailsInitStates());

  static MovieDetailsCubit get(context) => BlocProvider.of(context);

  WebServices _services = WebServices();

  late GetMovieDetailsUseCase _getMovieDetailsUseCase;
  late GetMovieDetailsRepository _getMovieDetailsRepository;
  late GetMovieDetailsDataSource _getMovieDetailsDataSource;


  late GetSimilarMoviesUseCase _getSimilarMoviesUseCase;
  late GetSimilarMoviesRepository _getSimilarMoviesRepository;
  late GetSimilarMoviesDataSource _getSimilarMoviesDataSource;

   MovieDetailsModel ?model;
  Future<void> getMovieDetails({int ?id}) async {
    emit(MovieDetailsLoadingStates());
    _getMovieDetailsDataSource = GetMovieDetailsDataSource(_services.freeDio);
    _getMovieDetailsRepository = GetMovieDetailsRepositoryImp(_getMovieDetailsDataSource);
    _getMovieDetailsUseCase = GetMovieDetailsUseCase(_getMovieDetailsRepository);
    var result = await _getMovieDetailsUseCase.excute(id: id);

    return result.fold(
      (fail) {
        var error = fail as ServerFailure;
        emit(MovieDetailsErrorStates());
      },
      (data) async {
Future.delayed(const Duration(milliseconds: 200),() => emit(MovieDetailsSuccessStates(model: data)),);

getSimilarMoviesList(id: id);


      },
    );
  }
   List<SliderEntity> _newSimilarMoviesList = [];
  List<SliderEntity> get newSimilarMoviesList => _newSimilarMoviesList;

  Future<void> getSimilarMoviesList({int? id,}) async {
    //emit(SimilarMoviesLoadingStates());

    _getSimilarMoviesDataSource = GetSimilarMoviesDataSource(_services.freeDio);
    _getSimilarMoviesRepository = GetSimilarMoviesRepositoryImp(_getSimilarMoviesDataSource);
    _getSimilarMoviesUseCase = GetSimilarMoviesUseCase(_getSimilarMoviesRepository);
    var result = await _getSimilarMoviesUseCase.excute(

id:id ,
    );
    return result.fold(
          (fail) {
        var error = fail as ServerFailure;
        emit(SimilarMoviesErrorStates());
      },
          (data) {
  // emit(SimilarMoviesSuccessStates());
        _newSimilarMoviesList = data;

      },
    );
  }



}
