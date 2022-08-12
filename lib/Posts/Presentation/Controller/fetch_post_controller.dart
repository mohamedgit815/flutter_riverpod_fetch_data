import 'package:flutter/material.dart';
import 'package:flutter_fetch_riverpod_app/Posts/Domain/Entities/post_entities.dart';
import 'package:flutter_fetch_riverpod_app/Posts/Domain/UseCase/post_usecase.dart';

class FetchPostController extends ChangeNotifier {
  final PostUseCase postUseCase;
  final List<PostEntities> data = <PostEntities>[];


  FetchPostController(this.postUseCase){
    postUseCase.execute();
  }


  Future<List<PostEntities>> getData() async {
    notifyListeners();
    return await postUseCase.execute();
  }



}