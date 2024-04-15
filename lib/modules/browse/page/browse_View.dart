import 'package:flutter/material.dart';
import 'package:movie_app/modules/browse/widget/widget_browse.dart';

class browseView extends StatelessWidget {
  final List<String> filmName=["ali","ola","maryam","ali","ola","maryam","ali","ola","maryam","ali","ola","maryam"];
  browseView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return  Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(toolbarHeight: 20),
      body:  Column(
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
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.4,
                  ),
                  itemCount: filmName.length,
                  itemBuilder: (context, index) => browseWidget(name: filmName[index]),),
            ),
          )

        ],
      ),
    );
  }
}
