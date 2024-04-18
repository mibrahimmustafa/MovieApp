import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/modules/Home/bloc/movie_details_cubit/states.dart';

import '../../bloc/movie_details_cubit/cubit.dart';
import '../widget/custom_list_view.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => MovieDetailsCubit()..getMovieDetails(id: id),
        child: BlocConsumer<MovieDetailsCubit, MovieDetailsStates>(
          listener: (context, state) {

            if(state is MovieDetailsSuccessStates){

            //  MovieDetailsCubit().getSimilarMoviesList(id: id);
            }
          },
          builder: (context, state) {
            var cubit = MovieDetailsCubit.get(context);

            if (state is MovieDetailsLoadingStates) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            }
            if (state is MovieDetailsSuccessStates) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: const Color(0xFF282A28),
                  title: Text(
                    state.model!.title.toString(),
                  ),
                  centerTitle: true,
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            "https://image.tmdb.org/t/p/w500${state.model!.posterPath}",
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.24,
                        width: double.infinity,
                        fadeInDuration: const Duration(seconds: 1),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => const Center(
                                child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator())),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          state.model!.title.toString(),
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          state.model!.releaseDate.toString(),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  "https://image.tmdb.org/t/p/w500${state.model!.posterPath}",
                              fit: BoxFit.cover,
                              width: 125,
                              height: 180,
                              fadeInDuration: const Duration(seconds: 1),
                              progressIndicatorBuilder: (context, url,
                                      downloadProgress) =>
                                  const Center(
                                      child: SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator())),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 35,
                                    child: ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                        width: 5,
                                      ),
                                      itemBuilder: (context, index) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border:
                                                Border.all(color: Colors.grey),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Center(
                                                child: Text(
                                              state.model!.genres?[index].name
                                                      .toString() ??
                                                  "",
                                              textAlign: TextAlign.center,
                                            )),
                                          ),
                                        );
                                      },
                                      itemCount: state.model!.genres!.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      state.model!.overview.toString(),
                                      maxLines: 5,
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amberAccent,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        state.model!.voteAverage.toString(),
                                        style: const TextStyle(fontSize: 18),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BlocConsumer<MovieDetailsCubit, MovieDetailsStates>(

                          builder: (context, state) {
                            if(state is MovieDetailsSuccessStates){
                              return   CustomListView(
                                titleListName: "More Like This",
                                newRealeasesList: cubit.newSimilarMoviesList,
                                isShowDetails: true,
                              );
                            }else{
                              return SizedBox();
                            }


                          },
                          listener: (context, state) {})
                    ],
                  ),
                ),
              );
            }
            if (state is MovieDetailsErrorStates) {
              return const Center(
                child: Text("Errors"),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
