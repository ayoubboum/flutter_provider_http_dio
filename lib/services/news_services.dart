import 'package:dio/dio.dart';
import 'package:fltr_provider/model/news.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsServices {
  News _get_news = new News();
  Dio dio;
  NewsServices() {
    BaseOptions options = new BaseOptions(
      baseUrl: "http://newsapi.org",
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    print('Constructor  ' + options.receiveTimeout.toString());
    dio = new Dio(options);
  }

  Future<News> getNews() async {
    String jsonNews = await rootBundle.loadString('assets/json/news.json');
    final jsonResponse = json.decode(jsonNews);
    _get_news = News.fromJSON(jsonResponse);
    print("CategorieAsset " + _get_news.articles[0].content);
    return _get_news;
  }

  Future<News> getNewss() async {
    String jsonNews = await rootBundle.loadString('assets/json/news.json');
    // print('Test king 1:  ');
    // var jsonNews = await dio.get(
    //     'http://newsapi.org/v2/everything?q=bitcoin&from=2020-01-25&sortBy=publishedAt&apiKey=7f3c604b6e2245c88487fdadc9cac1e2');
    final jsonResponse = jsonNews;
    // print('Test king :  ' + jsonNews.toString());
    _get_news = News.fromJSON(json.decode(jsonResponse));
    // print("CategorieAsset " + _get_news.articles[0].content);
    return _get_news;
  }
}
