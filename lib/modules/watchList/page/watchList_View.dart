import 'package:flutter/material.dart';
import 'package:movie_app/modules/task_models.dart';
import 'package:movie_app/modules/watchList/widget/task_item_widget.dart';
import '../../firebase_func/firestore_Utiles.dart';


class watchListView extends StatelessWidget {
  const watchListView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(toolbarHeight: 20),
      body:   Column(
          children: [
             const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text("WatchList",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w400,fontFamily: "Inter"),),
                ],
              ),
            ),
            FutureBuilder<List<TaskModel>>(
                future:FireStoreUtiles().getDataFromFirestore(),
                builder: (context, snapshot) {
                  if(snapshot.hasError) {
                      return const Column(
                        children: [
                          Text('something happen '),
                          Icon(Icons.refresh),
                        ],
                      );
                  }
                  else if(snapshot.connectionState==ConnectionState.waiting){
                    return const Center(child: CircularProgressIndicator());
                  }
                  var tasksList=snapshot.data??[];
                  return Expanded(
                    child: ListView.builder(
                        itemBuilder: (context, index) => TaskItemWidget(taskModel: tasksList[index]),
                      itemCount: tasksList.length,

                    ),
                  );
                },
            ),
          ],
      ),
    );
  }
}
