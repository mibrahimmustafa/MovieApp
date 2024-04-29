import 'package:flutter/material.dart';

import '../../search/api_services.dart';
import '../../search/movie_detailed_screen.dart';
import '../../search/movie_recommendation_mode.dart';
import '../../search/search_model.dart';
import '../../search/utils.dart';

class categoryDetails extends StatefulWidget {
  const categoryDetails({super.key, required this.movieID,});
  final int movieID;

  @override
  State<categoryDetails> createState() => _categoryDetailsState();

}

class _categoryDetailsState extends State<categoryDetails> {

  ApiServices apiServices = ApiServices();
  SearchModel? searchedMovie;
  late Future<MovieRecommendationsModel> popularMovies;

  void search(movieID) {
    apiServices.getSearchedMovie(movieID).then((results) {
      setState(() {
        searchedMovie = results;
        //print (results);
        print (movieID);
      });
    });
  }
  @override
  void initState() {
    popularMovies = apiServices.getPopularMovies();
    super.initState();
    print(popularMovies.toString());
  }


  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);

    return  Scaffold(
        backgroundColor: theme.primaryColor,
        appBar: AppBar(automaticallyImplyLeading: true,),
        body: FutureBuilder<MovieRecommendationsModel>(
          future: popularMovies,
          builder: (context, snapshot) {
            var data = snapshot.data?.results;
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.builder(
                itemCount: data?.length??0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  //  mainAxisSpacing: 200,
                  crossAxisSpacing: 20,
                  childAspectRatio: 1 / 2,
                ),
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
                    child: Column(
                      children: [
                        Image.network(
                          '$imageUrl${data?[index].posterPath}',
                          fit: BoxFit.fitHeight,
                        ),
                        Text(data![index].title,
                          style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                          ),),


                      ],
                    ),
                  );
                },),
            );
          },

        )
    );
  }
}
