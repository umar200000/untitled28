import 'package:dio/dio.dart';
import 'package:untitled28/pages/internet_page/urel.dart';
import 'package:untitled28/pages/model_page/model_class.dart';

class Internetdata {
  final _dio = Dio();

  Future<List<ModelDataPosts>> getPosts() async {
    List<ModelDataPosts> list = [];
    Response response = await _dio.get("${Urel.getDataUrel}/posts");
    for (var element in response.data) {
      list.add(ModelDataPosts.fromJson(element));
    }

    return list;
  }

  Future<List<ModelDataPosts>> getPostsError() async {
    List<ModelDataPosts> list = [];
    Response response = await _dio.get("${Urel.getDataUrel}/posts1233435");
    for (var element in response.data) {
      list.add(ModelDataPosts.fromJson(element));
    }

    return list;
  }

  Future<ModelDataPosts> getOnlePost(int id) async {
    Response response = await _dio.get("${Urel.getDataUrel}/posts/$id");
    return ModelDataPosts.fromJson(response.data);
  }

  Future<ModelDataPosts> getOnlePostError(int id) async {
    Response response = await _dio.get("${Urel.getDataUrel}/posts1234/$id");
    return ModelDataPosts.fromJson(response.data);
  }
}
