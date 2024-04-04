import 'package:flutter/material.dart';
class browseWidget extends StatelessWidget {
  String name="";
   browseWidget({super.key,required this.name});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 120,
        height: 100,
        //color: Colors.pink,
        //child: Text(name),

        child: Stack(
          alignment: Alignment.center,
          children: [
             Image.asset("assets/images/search_image.png"),
             Text(name,
             style: const TextStyle(
               fontFamily: "Inter",
               fontWeight: FontWeight.w600,
               fontSize: 18,
               color: Colors.white,
             ),),
           ],
        ),
      ),
    );
  }
}
