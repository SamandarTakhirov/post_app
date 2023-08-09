import 'dart:convert';


import '../../../../common/constants/api_constants.dart';
import '../../../../common/services/api_service.dart';
import '../base_model.dart';
import '../post_model.dart';

abstract interface class IPostRepository {
  const IPostRepository();

  Future<List<PostModel>> getAllPosts();
  Future<List<PostModel>> searchPosts();
}

class PostRepositoryImpl implements IPostRepository {
  final APIService apiService;

  const PostRepositoryImpl(this.apiService);


  @override
  Future<List<PostModel>> getAllPosts() async {
    String response = await apiService.request(ApiConst.allPostsPath);
    BaseModel base = BaseModel.fromJson(jsonDecode(response));

    return base.posts;
  }

  @override
  Future<List<PostModel>> searchPosts() async{
    String response = await apiService.request(ApiConst.searchPosts);
    BaseModel base = BaseModel.fromJson(jsonDecode(response));

    return base.posts;
  }

}