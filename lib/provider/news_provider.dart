import 'package:fltr_provider/model/news.dart';
import 'package:fltr_provider/provider/base_state.dart';
import 'package:fltr_provider/services/news_services.dart';

class NewsProvider extends BaseState {
  News _get_news = new News();

  News get news => _get_news;
  // Future<News> getNews() async {
  //   String jsonNews = await rootBundle.loadString('assets/json/news.json');
  //   final jsonResponse = json.decode(jsonNews);
  //   _get_news = News.fromJSON(jsonResponse);
  //   print("CategorieAsset " + _get_news.articles[0].content);
  //   setState(ViewState.LOADED);
  //   return _get_news;
  // }
  NewsServices _newsServices = new NewsServices();
  Future<News> getNews() async {
    // String jsonNews = await rootBundle.loadString('assets/json/news.json');
    _get_news = await _newsServices.getNewss().catchError((onError) {
      print('onError =>  ' + onError.toString());
      setState(ViewState.LOADED);
    });
    print("CategorieAsset =  " + _get_news.articles.length.toString());
    setState(ViewState.LOADED);
    return _get_news;
  }
}
