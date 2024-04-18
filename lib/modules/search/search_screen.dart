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
                searchController.text.isEmpty
                    ? FutureBuilder<MovieRecommendationsModel>(
                  future: popularMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data?.results;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Top Searches",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                 padding: const EdgeInsets.all(3),
                                scrollDirection: Axis.vertical,
                                itemCount: data!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MovieDetailScreen(
                                                movieId: data[index].id,
                                              ),
                                        ),
                                      );
                                    },
                                    child: SizedBox(
                                     height: 120,
                                      width:50,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.network(
                                            '$imageUrl${data[index].posterPath}',
                                            fit: BoxFit.fitHeight,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(data[index].title),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(data[index].voteAverage.toString())
                                        ],
                                      ),

                                    ),
                                  );
                                },
                              )
                            ]),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
                    : searchedMovie == null
                    ? const SizedBox.shrink()
                    : GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: searchedMovie?.results.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 5,
                    childAspectRatio: 1.2 / 2,
                  ),
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
                          child: CachedNetworkImage(
                            imageUrl:
                            '$imageUrl${searchedMovie?.results[index].backdropPath}',
                            height: 170,
                          ),
                        ),
                        Text(
                          searchedMovie!.results[index].title,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
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
