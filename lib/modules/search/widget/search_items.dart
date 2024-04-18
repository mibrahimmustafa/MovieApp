import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:movie_app/modules/search/page/search_view.dart';
import 'package:movie_app/modules/search/page/movie_model.dart ';
=======
>>>>>>> Seach_page



class SearchItems extends StatefulWidget {
  const SearchItems({super.key});

  @override
  State<SearchItems> createState() => _SearchItemsState();
}

class _SearchItemsState extends State<SearchItems> {



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //itemCount: display_list.length,
        itemBuilder: (context, index) => ListTile(

        ),);
  }
}
