import 'package:flutter/material.dart';



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
        itemBuilder: (context, index) => const ListTile(

        ),);
  }
}
