import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'category_details.dart';

class browseView extends StatefulWidget {

  browseView({super.key});

  @override
  State<browseView> createState() => _browseViewState();
}

class _browseViewState extends State<browseView> {


  List categoryname=[];

  Future genres() async {
    String url='https://api.themoviedb.org/3/genre/movie/list?api_key=b3f80fb0f7f9a63ba5c589e1bb9a7b78';
    var response=await http.get(Uri.parse(url));
    print(response.body);
    //var responsebody=jsonDecode(response.body);
    final List<dynamic> responsebody = json.decode(response.body)['genres'];


    setState(() {
      categoryname.addAll(responsebody);
    });

    print(categoryname);
    // print(responsebosy[2]);
  }


  @override
  void initState(){
    genres();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);

    return  Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(toolbarHeight: 20),

        body: Column(
          children: [
            const SizedBox(height: 40,),
            Row(
              children: [
                Text('Browse Category', style: theme.textTheme.labelLarge,),
              ],
            ),

            const SizedBox(height: 10,),

            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: categoryname.isEmpty
                  ?const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                    itemCount: categoryname.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 30,
                      childAspectRatio: 1.4,
                    ),
                    itemBuilder: (context, i) {
                      return Center(
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) =>  categoryDetails(movieId: categoryname[i]['id'],),));
                              },
                              child: Stack(
                                children: [
                                  Image.asset('assets/images/categ1.png',opacity: const AlwaysStoppedAnimation(.5)),
                                  Positioned(
                                    top: 35,
                                    left: 35,
                                    child: Text('${categoryname[i]['name']}',
                                        style: theme.textTheme.titleMedium?.copyWith(
                                          fontWeight: FontWeight.w900,
                                        ),),
                                  ),
                                ],
                              ),
                            )),
                      );
                    },),
            ))
          ],
        )
    );
  }
}