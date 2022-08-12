import 'package:flutter_fetch_riverpod_app/Posts/Data/DataSoucre/post_data_source.dart';
import 'package:flutter_fetch_riverpod_app/Posts/Data/Models/post_model.dart';
import 'package:flutter_fetch_riverpod_app/Posts/Domain/Entities/post_entities.dart';
import 'package:flutter_fetch_riverpod_app/Posts/Domain/Repository/post_repository.dart';

class PostRepository extends BasePostRepository {
  final BasePostDataSource basePostDataSource;

  PostRepository(this.basePostDataSource);

  @override
  Future<List<PostEntities>> getPostData() async {
    final List<PostModel> _result = await basePostDataSource.getPostData();
    try {
      return _result;
    } catch (e) {
      throw Exception('Null');
    }
  }


}