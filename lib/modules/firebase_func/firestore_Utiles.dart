import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/modules/task_models.dart';

class FireStoreUtiles{

  CollectionReference<TaskModel>getCollectionReference(){
    var db = FirebaseFirestore.instance;
    return db.collection('Tasks_List').withConverter<TaskModel>(
        fromFirestore: (snapshot, options) => TaskModel.fromFireStore(snapshot.data()!),
        toFirestore: (taskModel, options) => taskModel.toFireStore());
  }

 Future<void> addNewTask(TaskModel data){
    var conectionRef=getCollectionReference();
    var docRef=conectionRef.doc();
    data.id=docRef.id;
   return docRef.set(data);

  }

 Future<List<TaskModel>> getDataFromFirestore () async{
    var conectionRef=getCollectionReference();

   var data= await conectionRef.get();
   return data.docs.map((e) => e.data()).toList();

  }

deleteTask (){
    var conectionRef=getCollectionReference();
  }

}