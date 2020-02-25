import 'package:fltr_provider/model/news.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fltr_provider/provider/news_provider.dart';

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _filter = new TextEditingController();
  Future _newsFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      _newsFuture = Provider.of<NewsProvider>(context, listen: false).getNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    final news_provider = Provider.of<NewsProvider>(context);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: TextField(
          controller: _filter,
          decoration: new InputDecoration(hintText: 'Search...'),
          // autofocus: true,
          onChanged: (value) {
            // print(value);
            // news_provider.valSearchBar = value;
            news_provider.filterList(value);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: news_provider.listTest.length,
        itemBuilder: (context, index) => Text(news_provider.listTest[index]),
      ),
    );
  }
}
