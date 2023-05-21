
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_calisma/service_and_models/post_model.dart';

abstract class IPostService {
  Future<bool> addTryMetod(PostModel postModel);

  Future<bool> putTryMetod(PostModel postModel, int id);

  Future<bool> deleteTryMetod(int id);

  Future<List<PostModel>?> fetchTryMetod();

  Future<List<PostModel>?> fetchCustomUserItems(int id);


}

class PostService implements IPostService {
  final Dio _dio;

  PostService()
      : _dio =
  Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  @override
  Future<bool> addTryMetod(PostModel postModel) async {
    try {
      final response = await _dio.post(_TryPath.posts.name);
      return response.statusCode == HttpStatus.ok;
    } on DioError catch (error) {
      _ShowTryDebug.showDioError(error, this);
    }
    return false;
  }

  @override
  Future<bool> putTryMetod(PostModel postModel, int id) async {
    try {
      final response =
      await _dio.put("${_TryPath.posts.name}/$id", data: postModel);
      return response.statusCode == HttpStatus.ok;
    } on DioError catch (error) {
      _ShowTryDebug.showDioError(error, this);
      return false;
    }
  }

  @override
  Future<bool> deleteTryMetod(int id) async {
    try {
      final response = await _dio.put("${_TryPath.posts.name}/$id");
      return response.statusCode == HttpStatus.ok;
    } on DioError catch (error) {
      _ShowTryDebug.showDioError(error, this);
    }
    return false;
  }

  @override
  Future<List<PostModel>?> fetchTryMetod() async {
    try {
      final response = await _dio.get(_TryPath.posts.name);
      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;
        if (datas is List) {
          return datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    }
    on DioError catch (error) {
      _ShowTryDebug.showDioError(error, this);
    }
    return null;
  }

  @override
  Future<List<PostModel>?> fetchCustomUserItems(int id) async {
    try {
      final response = await _dio.get(
          _TryPath.posts.name, queryParameters:{_TryPath.id.name:id});
      if(response.statusCode==200){
        final datas =response.data;
        if(datas is List){
          return datas.map((e) =>PostModel.fromJson(e)).toList();
        }
      }
    }
    on DioError catch(error){
      _ShowTryDebug.showDioError(error, this);
      }

    return null;
  }

}

enum _TryPath { posts, id }

class _ShowTryDebug{
  static void showDioError<T>(DioError error,T type){
    if(kDebugMode){
      print(error.message);
      print(type);
      print("----------");
    }
  }
}
