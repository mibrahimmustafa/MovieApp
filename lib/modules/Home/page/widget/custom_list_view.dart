import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../firebase_func/firestore_Utiles.dart';
import '../../../task_models.dart';
import '../../domain/entites/home/slider_entity.dart';
import '../more_page/movie_details_page.dart';

class CustomListView extends StatelessWidget {
  CustomListView(
      {super.key, required this.titleListName, this.newRealeasesList,this.isShowDetails=false});
  final String? titleListName;
  final List<SliderEntity>? newRealeasesList;
final bool ?isShowDetails;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.topCenter,
      color: const Color(0xFF282A28),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titleListName ?? "",
              style: const TextStyle(fontSize: 16),textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 10,
            ),

            SizedBox(
              height:isShowDetails==true? height * 0.27: height * 0.20,
              child:      newRealeasesList!.isEmpty?const Center(child: Text("Not Found")):ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),

                itemBuilder: (context, index) => InkWell(
                  onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) =>  MovieDetailsPage(id:newRealeasesList![index].id??0 ,)));


                  },
                  child: SingleChildScrollView(
                    child: SizedBox(
                        width: width * 0.25,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Stack(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl:
                                        "https://image.tmdb.org/t/p/w500${newRealeasesList![index].posterPath}",
                                    fit: BoxFit.cover,
                                    fadeInDuration: const Duration(seconds: 1),
                                    progressIndicatorBuilder: (context, url,
                                            downloadProgress) =>
                                        const Center(
                                            child: SizedBox(
                                                width: 20,
                                                height: 20,
                                                child: CircularProgressIndicator())),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                 // Text('${newRealeasesList![index].id}'),
                                  Container(
                                    width: 30,
                                    height: 40,
                                    color: Colors.black,
                                    child:  IconButton(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      icon: const Icon(Icons.add),
                                      color: Colors.white,
                                      onPressed: () {
                                        var data=TaskModel(
                                            title: newRealeasesList![index].title.toString(),
                                            description: newRealeasesList![index].overview.toString(),
                                            isDone: false,
                                            datetime: newRealeasesList![index].releaseDate.toString(),
                                          posterPath: newRealeasesList![index].posterPath.toString(),
                                        );
                                        FireStoreUtiles().addNewTask(data);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            if(isShowDetails==true)...[
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amberAccent,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    newRealeasesList![index].voteAverage.toString(),
                                  )
                                ],
                              ),
                              SizedBox(
                                  child: Text(
                                    newRealeasesList![index].title.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                              Text(
                                newRealeasesList![index].releaseDate.toString(),
                                style: const TextStyle(
                                    fontSize: 9, color: Colors.grey),
                              )
                            ]
                    
                          ],
                        )),
                  ),
                ),

                scrollDirection: Axis.horizontal,
                //   physics: NeverScrollableScrollPhysics(),
                itemCount: newRealeasesList!.length,
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
