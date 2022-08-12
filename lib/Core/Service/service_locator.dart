import 'package:flutter_fetch_riverpod_app/Posts/Data/DataSoucre/post_data_source.dart';
import 'package:flutter_fetch_riverpod_app/Posts/Data/Repository/post_repository.dart';
import 'package:flutter_fetch_riverpod_app/Posts/Domain/Repository/post_repository.dart';
import 'package:flutter_fetch_riverpod_app/Posts/Domain/UseCase/post_usecase.dart';
import 'package:flutter_fetch_riverpod_app/Posts/Presentation/Controller/fetch_post_controller.dart';
import 'package:get_it/get_it.dart';


final sl = GetIt.instance;

class ServiceLocator {

  void init() {
    /// RiverPod
    sl.registerFactory(() => FetchPostController(sl()));


    /// Use Cases
    sl.registerLazySingleton(() => PostUseCase(sl()));


    /// Repository
    sl.registerLazySingleton<BasePostRepository>(() => PostRepository(sl()));


    /// DataSource
    sl.registerLazySingleton<BasePostDataSource>(() => PostDataSource());
  }

}