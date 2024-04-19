import 'package:flutter/material.dart';
import 'package:movie_app/modules/search/category_detail.dart';
import '../../search/api_services.dart';

class browseView extends StatefulWidget {

  browseView({super.key});

  @override
  State<browseView> createState() => _browseViewState();
}

class _browseViewState extends State<browseView> {
  ApiServices apiServices = ApiServices();
  CategoryDetails? category;
  late Future<CategoryDetails> categoryMovies;

  categoryfetch() {
    categoryMovies = apiServices.getMovieCategory() ;
   return apiServices.getMovieCategory();
  }

  @override
  void initState() {
    categoryfetch();
    super.initState();
  }

  // final List<String> filmName=["ali","ola","maryam","ali","ola","maryam","ali","ola","maryam","ali","ola","maryam"];

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    var results =categoryfetch();
   //  print("results = $results");
    // results=null;
    return  Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(toolbarHeight: 20),
      body:SingleChildScrollView(
        child: FutureBuilder(
          future: categoryMovies,
          builder: (context, snapshot) {
            if (snapshot.hasData){
              final movie = snapshot.data;
             // String genresText = movie!.genres.map((genre) => genre.name).join(', ');
              List genresText = movie!.genres.map((genre) => genre.name) as List;
              print("lentgh : $movie.genres.length");
              return Column(
                children: [

                  //Text(genresText),

                  ListView.builder(
                    itemCount: movie.genres.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: genresText.single,
                        );
                      },)
                ],
              );
            }
            return const SizedBox(child: Text('error'),);
          },
        ),
      ),
    );
  }
}
