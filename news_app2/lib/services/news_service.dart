import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';

class NewsService {
  final dio = Dio();

  Future<List<NewsModel>> fetchNews() async {
    final response = await dio.get("https://newsapi.org/v2/everything?q=bitcoin&apiKey=885648621a594a6daad5ce80692c1f3b");
    List<NewsModel> articles = [];
    for (var element in response.data['articles']) {
      final newsArticle = NewsModel(
        title: element['title'],
        description: element['description'],
        urlToImage: element['urlToImage'],
        publishedAt: element['publishedAt'],
        author: element['author'],
      );
      articles.add(newsArticle);
    }
    return articles;
  }

  Future addNewPost() async {
    final response = await dio.post(
      "https://api.restful-api.dev/objects",
      data: {
        "name": "Apple pay",
        "data": {"year": 2024, "price": 100, "CPU model": "Intel Core i9", "Hard disk size": "2TB"}
      },
    );
    debugPrint(response.data);
  }

  Future putOldPost() async {
    final response = await dio.put(
      "https://api.restful-api.dev/objects/ff80818191216edf019123039f390552",
      data: {
        "name": "Apple pay",
        "data": {"year": 2025, "price": 300, "CPU model": "Intel Core i9", "Hard disk size": "2TB"}
      },
    );
    debugPrint(response.data);
  }

//ff80818191216edf01912300865c054d
  Future deletePost() async {
    final response = await dio.delete("https://api.restful-api.dev/objects/ff80818191216edf01912300865c054d");
    debugPrint(response.data);
  }
}
