import 'package:dio/dio.dart';
import 'package:fltr_provider/model/news.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:http/http.dart' as http;

BaseOptions options = new BaseOptions(
  baseUrl: "http://newsapi.org",
  connectTimeout: 100,
  receiveTimeout: 100,
);

class NewsServices {
  News _get_news = new News();
  Dio dio = new Dio(options);

  Future<News> getNews() async {
    String jsonNews = await rootBundle.loadString('assets/json/news.json');
    final jsonResponse = json.decode(jsonNews);
    _get_news = News.fromJSON(jsonResponse);
    print("CategorieAsset " + _get_news.articles[0].content);
    return _get_news;
  }

  Future<News> getNewss() async {
    // String jsonNews = await rootBundle.loadString('assets/json/news.json');
    var jsonNews = await dio.get(
        'http://newsapi.org/v2/everything?q=bitcoin&from=2020-01-22&sortBy=publishedAt&apiKey=7f3c604b6e2245c88487fdadc9cac1e2');
    final jsonResponse = jsonNews.data;
    print('Test king :  ' + jsonNews.data.toString());
    _get_news = News.fromJSON(jsonResponse);
    // print("CategorieAsset " + _get_news.articles[0].content);
    return _get_news;
  }
}
