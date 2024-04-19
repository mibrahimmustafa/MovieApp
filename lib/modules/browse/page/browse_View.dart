import 'package:flutter/material.dart';
import 'package:movie_app/modules/browse/widget/widget_browse.dart';

import '../../search/api_services.dart';
import '../../search/category_detail.dart';

class browseView extends StatefulWidget {

  browseView({super.key});

  @override
  State<browseView> createState() => _browseViewState();
}

class _browseViewState extends State<browseView> {
  ApiServices apiServices = ApiServices();
  CategoryDetails? category;
  late Future<Genre> categoryMovies;

  categoryfetch() {
    apiServices.getMovieCategory().then((results) {

        print("Category = $category");
        return results;

    });
  }

  @override
  void initState() {
    super.initState();
  }

  // final List<String> filmName=["ali","ola","maryam","ali","ola","maryam","ali","ola","maryam","ali","ola","maryam"];

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    category=categoryfetch();
    return  Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(toolbarHeight: 20),
      body:  category==null
      ?Text('error')
      : Column(
        children: [
           Row(
            children: [
              Text("Browse Category",
                style: theme.textTheme.labelLarge,
              ),
            ],
          ),

          Expanded(
           // child: ListView.builder(
             // itemBuilder: (context, index) => browseWidget(name: filmName[index],),
              //itemCount: filmName.length,
            //),
            child: Text('hello')
          )

        ],
      ),
    );
  }
}
