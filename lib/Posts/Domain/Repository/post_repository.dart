import 'package:flutter_fetch_riverpod_app/Posts/Domain/Entities/post_entities.dart';

abstract class BasePostRepository {
  Future<List<PostEntities>> getPostData();
}