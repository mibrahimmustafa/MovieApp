import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/modules/task_models.dart';

import '../../search/utils.dart';

class TaskItemWidget extends StatelessWidget {
  final TaskModel taskModel;
  const TaskItemWidget({super.key, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    var mediaquery=MediaQuery.of(context).size;
    var theme=Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: InkWell(
              onTap: () {

              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    //child: Image.asset("assets/images/movies_splash_background.png",height: 100,width: 100,),
                    child: CachedNetworkImage(
                      imageUrl:
                      "$imageUrl${taskModel.posterPath}",
                      height: 100,
                    ),
                  ),
                  //Text(taskModel.title, style: theme.textTheme.titleLarge,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(taskModel.title,
                              style: theme.textTheme.titleLarge,),
                          ],
                        ),
                        Row(
                          children: [
                            Text(taskModel.datetime,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                  color: Colors.grey.shade600
                              ),),
                          ],
                        ),
                        Row(
                          children: [
                            Text(taskModel.title,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                  color: Colors.grey.shade700
                              ),),
                          ],
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(thickness: 1,color: Colors.white,)
        ],
      ),
    );

  }
}
