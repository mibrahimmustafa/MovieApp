import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'search_model.dart';
import 'movie_detailed_screen.dart';
import 'api_services.dart';
import 'utils.dart';
import 'movie_recommendation_mode.dart';

class SearchScreen extends StatefulWidget {

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ApiServices apiServices = ApiServices();
  TextEditingController searchController = TextEditingController();
  SearchModel? searchedMovie;
  late Future<MovieRecommendationsModel> popularMovies;

  void search(String query) {
    apiServices.getSearchedMovie(query).then((results) {
      setState(() {
        searchedMovie = results;
      });
    });
  }

  @override
  void initState() {
    popularMovies = apiServices.getPopularMovies();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaquery=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                CupertinoSearchTextField(
                  controller: searchController,
                  padding: const EdgeInsets.all(20.0),
                  borderRadius: BorderRadius.circular(30),

                  prefixIcon: const Icon(
                    CupertinoIcons.search,
                    color: Colors.grey,
                  ),
                  suffixIcon: const Icon(
                    Icons.cancel,
                    color: Colors.black,
                  ),
                  style: const TextStyle(color: Colors.white),
                  backgroundColor: Colors.grey.withOpacity(0.3),
                  onChanged: (value) {
                    if (value.isEmpty) {
                    } else {
                      search(searchController.text);
                    }
                  },
                ),
                const SizedBox(height: 20,),

                searchController.text.isEmpty
                    ?  Padding(
                      padding:  EdgeInsets.symmetric(vertical: mediaquery.height*.27),
                      child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.asset("assets/images/search_image.png"),
                          //   borderRadius: BorderRadius.circular(32),
                        ),
                    )
                    : searchedMovie == null
                    ? const SizedBox.shrink()
                    : ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: searchedMovie?.results.length,
                //  gridDelegate:
                 // const SliverGridDelegateWithFixedCrossAxisCount(
                  //  crossAxisCount: 1,
                    //mainAxisSpacing: 15,
                    //crossAxisSpacing: 5,
                    //childAspectRatio: 1.2 / 2,
                  //),
                  itemBuilder: (context, index) {
                    return searchedMovie!.results[index].backdropPath ==
                        null
                        ? Column(
                      children: [
                        Image.asset(
                          "assets/images/search_image.png",
                          height: 170,
                        ),
                        Text(
                          searchedMovie!.results[index].title,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        )
                      ],
                    )
                        :Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetailScreen(
                                        movieId: searchedMovie!
                                            .results[index].id),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: CachedNetworkImage(
                              imageUrl:'$imageUrl${searchedMovie?.results[index].backdropPath}',
                              height: 170,
                            ),
                            trailing: Text(searchedMovie!.results[index].voteAverage.toString()),
                            title: Text(searchedMovie!.results[index].title,style: const TextStyle(color: Colors.white,fontSize: 17),),
                            subtitle: Text(searchedMovie!.results[index].releaseDate.year.toString()),

                          ),
                        ),
                        Divider(
                          color: Colors.white,
                        )
                      ],
                    );
                  },

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
