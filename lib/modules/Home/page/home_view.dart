import 'package:flutter/material.dart';
class homeView extends StatelessWidget {
  const homeView({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(toolbarHeight: 20),
      body:  Column(
        mainAxisSize: MainAxisSize.max,
        children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
             mainAxisSize: MainAxisSize.max,
             children: [
               Expanded(
                 child: Stack(
                   clipBehavior: Clip.none,
                   children: [
                     Container(
                       height: height*.4,
                       color: Colors.transparent,
                       alignment: Alignment.topCenter,
                       child: Image.asset("assets/images/Image1.png"),
                     ),
                 Positioned(
                   top: 80,
                   left: 10,
                   child: Container(
                     width: 125,
                     height: 180,
                     child: Image.asset("assets/images/Image1.1.png"),
                   ),),

                     Positioned(
                       top: 80,
                       left: 10,
                       child: Container(
                         width: 30,
                         height: 40,
                        color: Colors.black,
                         child:Icon(Icons.add,color: Colors.white,),
                       ),),
                   ],
                 ),
               ),
             ],
           ),
         )
        ],
      ),
    );
  }
}
