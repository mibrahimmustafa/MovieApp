import '../../../../core/models/home_models/movie_details_model/movie_details_model.dart';

abstract class MovieDetailsStates {}




class MovieDetailsInitStates extends MovieDetailsStates {}
class MovieDetailsLoadingStates extends MovieDetailsStates {}
class MovieDetailsSuccessStates extends MovieDetailsStates {

  final MovieDetailsModel ?model;
  MovieDetailsSuccessStates({ this. model});
}
class MovieDetailsErrorStates extends MovieDetailsStates {}



class SimilarMoviesLoadingStates extends MovieDetailsStates {}
class SimilarMoviesSuccessStates extends MovieDetailsStates {

}
class SimilarMoviesErrorStates extends MovieDetailsStates {}