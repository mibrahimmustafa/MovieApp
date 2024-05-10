class TaskModel{
      String? id;
      String title;
      String description;
      bool isDone;
      String datetime;
      String posterPath;

      TaskModel({
        required this.title,
        required this.description,
        required this.isDone,
        required this.datetime,
        required this.posterPath,
      });

      //have data from firestore and store in in object to call
     factory TaskModel.fromFireStore(Map<String,dynamic>json) => TaskModel(
         title: json['title'],
         description: json['description'],
         isDone: json['isDone'],
         datetime: json['datetime'],
         posterPath: json['posterPath'],
     );

     //send data to firestore
     Map<String,dynamic> toFireStore(){
       return {
         'id' : id,
         'title': title,
         'description' : description,
         'isDone' : isDone,
         'datetime' :datetime,
         'posterPath': posterPath,
       };
     }
}