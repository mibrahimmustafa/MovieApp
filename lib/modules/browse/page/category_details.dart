import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../search/api_services.dart';
import '../../search/movie_detail_model.dart';
import '../../search/movie_detailed_screen.dart';
import '../../search/movie_recommendation_mode.dart';
import '../../search/utils.dart';


class categoryDetails extends StatefulWidget {
  categoryDetails({super.key, required this.movieId,});
  final int movieId;

  @override
  State<categoryDetails> createState() => _categoryDetailsState();
}
class _categoryDetailsState extends State<categoryDetails> {

  ApiServices apiServices = ApiServices();

  late Future<MovieDetailModel> movieDetail;
  late Future<MovieRecommendationsModel> movieRecommendationModel;

  @override
  void initState() {
    fetchInitialData();
    super.initState();
  }

  fetchInitialData() {
    movieDetail = apiServices.getMovieDetail(widget.movieId);
    movieRecommendationModel =
        apiServices.getMovieRecommendations(widget.movieId);
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: AppBar(automaticallyImplyLeading: true),
      body: SingleChildScrollView(
        child: Center(
          child:FutureBuilder(
            future: movieRecommendationModel,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final movie = snapshot.data;
        
                return movie!.results.isEmpty
                    ? const SizedBox()
                    : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      "More like this",
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: movie.results.length,
        
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        childAspectRatio: 1.6 / 2,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetailScreen(
                                        movieId: movie
                                            .results[index].id),
                              ),
                            );
                          },
                          child: CachedNetworkImage(
                            imageUrl:
                            "$imageUrl${movie.results[index].posterPath}",
                          ),
                        );
                      },
                    ),
                  ],
                );
              }
              return const Text("Something Went wrong");
            },
          ),
        ),
      ),
    );
  }
}