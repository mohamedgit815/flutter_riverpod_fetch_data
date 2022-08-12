import 'package:flutter_fetch_riverpod_app/Posts/Domain/Entities/post_entities.dart';
import 'package:flutter_fetch_riverpod_app/Posts/Domain/Repository/post_repository.dart';

class PostUseCase {
  final BasePostRepository basePostRepository;

  const PostUseCase(this.basePostRepository);


  Future<List<PostEntities>> execute() async {
   return await basePostRepository.getPostData();
  }

}