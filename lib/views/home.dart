import 'package:fltr_provider/model/categories.dart';
import 'package:fltr_provider/model/news.dart';
import 'package:fltr_provider/model/todo.dart';
import 'package:fltr_provider/provider/base_state.dart';
import 'package:fltr_provider/provider/todo_provider.dart';
import 'package:fltr_provider/provider/news_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future _categoriesFuture;
  Future _newsFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Future.delayed(Duration.zero, () {
    //   _categoriesFuture =
    //       Provider.of<TodoProvider>(context, listen: false).loadCategories();
    // });
    Future.delayed(Duration.zero, () {
      _newsFuture = Provider.of<NewsProvider>(context, listen: false).getNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    final news_provider = Provider.of<NewsProvider>(context);

    // final todo_provider = Provider.of<TodoProvider>(context);

    // // TODO: implement build
    // return FutureBuilder<CategoriesList>(
    //   initialData: todo_provider.get_todo,
    //   future: _categoriesFuture,
    //   builder: (context, snapshot) {
    //     print(snapshot.connectionState);
    //     if (snapshot.connectionState == ConnectionState.done) {
    //       if (snapshot.hasError) {
    //         return Center(child: Text('Error: Try again later ' + snapshot.hasError.toString()));
    //       }
    //       return todo_provider.viewState == ViewState.LOADED
    //           ? ListView.builder(
    //               itemCount: snapshot.data.categories.length,
    //               itemBuilder: (context, index) =>
    //                   Text('* ' + snapshot.data.categories[index].name),
    //             )
    //           : Center(child: Text('Error: Try again later'));
    //     } else
    //       return Center(child: Center(child: CircularProgressIndicator()));
    //   },
    // );

    // TODO: implement build
    return FutureBuilder<News>(
      initialData: news_provider.news,
      future: _newsFuture,
      builder: (context, snapshot) {
        print('data test =>  ' + snapshot.connectionState.toString());
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
                child: Text(
                    'Error: Try again later ' + snapshot.hasError.toString()));
          }
          return ListView.builder(
            itemCount: news_provider.news.articles.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Image.network(
                    'https://static.coindesk.com/wp-content/uploads/2020/02/Comets_Kick_up_Dust_in_Helix_Nebula_PIA09178.jpg',
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.low,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null)
                        return child;
                      else
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes
                                : null,
                          ),
                        );
                    },
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: <Widget>[
                      Text(
                        snapshot.data.articles[index].title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        snapshot.data.articles[index].description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )
                    ],
                  ),
                )
              ],
            ),
          );
          // return news_provider.viewState == ViewState.LOADED
          //     ? ListView.builder(
          //         itemCount: snapshot.data.categories.length,
          //         itemBuilder: (context, index) =>
          //             Text('* ' + snapshot.data.categories[index].name),
          //       )
          //     : Center(child: Text('Error: Try again later'));
        }
        // else if (snapshot.connectionState == ConnectionState.none) {
        //   return Center(
        //       child: Text(
        //           'Error: Try again later ' + snapshot.hasError.toString()));
        // } 
        
        else
          return Center(
            child: Center(child: CircularProgressIndicator()),
          );
      },
    );
  }
}
