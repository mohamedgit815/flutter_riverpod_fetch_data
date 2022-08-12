import 'package:flutter_fetch_riverpod_app/Posts/Domain/Entities/post_entities.dart';

class PostModel extends PostEntities {

  PostModel({
    required String title ,
    required String body ,
    required int id
  }) : super(name: title , body: body , id: id);


  factory PostModel.fromApp(Map<String,dynamic>map) {
    return PostModel(
        title: map['title'] ,
        body: map['body'] ,
        id: map['id']
    );
  }


}