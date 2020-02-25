import 'dart:convert';

import 'package:fltr_provider/model/news.dart';
import 'package:fltr_provider/provider/base_state.dart';
import 'package:fltr_provider/services/news_services.dart';

class NewsProvider extends BaseState {
  News _get_news = News();

  News get news => _get_news;
  // Future<News> getNews() async {
  //   String jsonNews = await rootBundle.loadString('assets/json/news.json');
  //   final jsonResponse = json.decode(jsonNews);
  //   _get_news = News.fromJSON(jsonResponse);
  //   print("CategorieAsset " + _get_news.articles[0].content);
  //   setState(ViewState.LOADED);
  //   return _get_news;
  // }
  NewsServices _newsServices = NewsServices();
  String valSearchBar = "";
  List _listTest = [];

  List get listTest => _listTest;

  // String get valSearchBar => valSearchBar;

  Future<News> getNews() async {
    // String jsonNews = await rootBundle.loadString('assets/json/news.json');
    _get_news = await _newsServices.getNewss().catchError((onError) {
      print('onError =>  ' + onError.toString());
      setState(ViewState.LOADED);
    });
    // _get_news.articles.forEach((res) {
    //   // res.author.contains(valSearchBar);
    //   // print(res.author.contains(valSearchBar));
    //   // print(res.author.contains(valSearchBar));
    //   print(res.author.toString());
    //   if (res.author
    //       .toString()
    //       .toLowerCase()
    //       .contains('Kelsey'.toLowerCase())) {
    //     listTest.add(res.author);
    //     print('--------------- listTest');
    //     print(listTest);
    //   }
    // });
    setState(ViewState.LOADED);
    return _get_news;
  }

  filterList(String valSearchBar) {
    print('--------------------' + valSearchBar);
    // print(valSearchBar);
    // if (valSearchBar == '') {
    //   listTest.add('no data');
    // } else {
    _listTest = [];
    if (valSearchBar == '') {
      _listTest = [];
    } else {
      _get_news.articles.forEach((res) {
        // res.author.contains(valSearchBar);
        // print(res.author.contains(valSearchBar));
        // print(res.author.contains(valSearchBar));
        if (res.author
            .toString()
            .toLowerCase()
            .contains(valSearchBar.toLowerCase())) {
          _listTest.add(res.author);
        }
      });
      print('List lenght : ' + _listTest.length.toString());
    }

    setState(ViewState.LOADED);
    // }

    // print(news);
  }
}
