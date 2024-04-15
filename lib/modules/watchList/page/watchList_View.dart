import 'package:flutter/material.dart';

class watchListView extends StatelessWidget {
  const watchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(toolbarHeight: 20),
      body:  Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("WatchList",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w400,fontFamily: "Inter"),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Image.asset("assets/images/movies_splash_background.png",height: 100,width: 100,),

                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("shimaa hossni mohamed",
                            style:TextStyle(
                              fontFamily: "Inter",
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),),
                        ],
                      ),
                      Row(
                        children: [
                          Text("2019",
                            style:TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.white30,
                            ),),
                        ],
                      ),
                      Row(
                        children: [
                          Text("hello everyone ",
                            style:TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.white30,
                            ),),
                        ],
                      ),

                    ],
                  ),


                ],
              ),

            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(thickness: 1,color: Colors.white,),
            )
          ],
      ),
    );
  }
}
