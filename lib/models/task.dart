class Task {
  late int id ;
  late String name;

  late bool isDone;

  Task({required this.name,  this.isDone = false});

  Task.fromMap(Map<String,dynamic> map){
    id = map['id'];
    name = map['name'];
    isDone = map['isDone'];
  }

  Map<String , dynamic> toMap(){
    Map<String, dynamic> map = <String,dynamic>{};
    map['name'] = name ;
    map['isDone'] = isDone ;
    return map ;

  }



}
