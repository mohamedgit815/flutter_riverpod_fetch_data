import 'package:dio/dio.dart';
import 'package:flutter_fetch_riverpod_app/Posts/Data/Models/post_model.dart';

abstract class BasePostDataSource {
  late List<dynamic> data;

  Future<List<PostModel>> getPostData();

}

class PostDataSource extends BasePostDataSource {

  @override
  Future<List<PostModel>> getPostData() async {
   final Response _response =  await Dio().getUri(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    data = _response.data;

   if(_response.statusCode == 200) {
     return data.map((e) => PostModel.fromApp(e)).toList();
   } else {
     throw Exception('No Data');
   }

  }

}