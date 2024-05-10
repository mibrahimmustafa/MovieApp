import 'package:flutter/material.dart';

import 'movie_model.dart';
class searchView extends StatefulWidget {
  static const String routeName="search";
  const searchView({super.key});

  @override
  State<searchView> createState() => _searchViewState();
}

class _searchViewState extends State<searchView> {

  static List<MovieModel>main_movies_list=[
    MovieModel("baby shark", 1990, "https://littlebeebooks.com/wp-content/uploads/2019/11/9781499810745.in04-901x550@2x.jpg", 4.5),
    MovieModel("Three Men and a Baby ", 1987, "https://www.looper.com/img/gallery/25-movies-about-babies-that-are-fun-for-the-whole-family/three-men-and-a-baby-1655909954.webp", 4.0),
    MovieModel("Honey I Blew Up the Kid", 1985, "https://www.looper.com/img/gallery/25-movies-about-babies-that-are-fun-for-the-whole-family/honey-i-blew-up-the-kid-1655909954.webp", 3.5),
    MovieModel("Storks", 2010, "https://www.looper.com/img/gallery/25-movies-about-babies-that-are-fun-for-the-whole-family/storks-1655909954.webp", 4.7)
  ];

  List<MovieModel>display_list=List.from(main_movies_list);

  void updateList(String value){
    //if(value=='')return[];
    setState(() {
      display_list=main_movies_list.where(
              (element)=>element.movie_title!.toLowerCase().contains(value.toLowerCase())).toList();

    });
  }

  final mycontroller=TextEditingController();

  @override
  void initistate(){
    super.initState();
    mycontroller.addListener(() {_printLastestValue;});
  }
  @override
  void dispose(){
    mycontroller.dispose();
    super.dispose();
  }
  void _printLastestValue(){
    final text=mycontroller.text;
    print(text);
  }

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return Scaffold(
      appBar: AppBar(toolbarHeight: 20),
      backgroundColor: Colors.transparent,
      body:  Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
              // onChanged: (value) => updateList(value),
               // onChanged: (value) {

                 // updateList(value);
                //},
                onChanged:(text) {
                  text.isEmpty ? _printLastestValue() :
                  updateList(text);
                },

                cursorColor: Colors.black,
                style: const TextStyle(
                    color: Colors.white
                ),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(50),
                  ),

                  prefixIcon: const Icon(Icons.search,color: Colors.white,size: 30),
                  hintStyle: const TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 20),
                  hintText: "Search",
                  filled: true,
                  fillColor: const Color(0xff514F4F),

                ),
              )
            ),
            Expanded(
                child: display_list.isEmpty
                    ? Expanded(
                    child: Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.asset("assets/images/search_image.png"),
                          //   borderRadius: BorderRadius.circular(32),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text:  TextSpan(
                              children: [
                                TextSpan(text: "No Movies Found",style: theme.textTheme.bodyMedium),
                              ],
                            ),),
                        ),
                      ],
                    ),

                  ),

            )
                    : ListView.builder(

                      itemCount: display_list.length,
                        itemBuilder: (context, index) => ListTile(
                             title: Text(
                          display_list[index].movie_title!,
                                style: theme.textTheme.bodyLarge,
                              ),
                              subtitle: Text("${display_list[index].movie_release_year!}",
                              style: theme.textTheme.bodyMedium,
                              ),
                              trailing: Text("${display_list[index].rating}",
                              style: theme.textTheme.bodyMedium,),
                              leading: Image.network(display_list[index].movie_poster_url!),
                      ),),

            ),



          ],
        ),
      ),

    );
  }
}
