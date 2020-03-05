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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
        body: news_provider.listTest.length > 0 &&
                news_provider.valSearchBar.length > 0
            ? ListView.builder(
                itemCount: news_provider.listTest.length,
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
                                value: loadingProgress.expectedTotalBytes !=
                                        null
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
                      child: Container(
                        height: 100.0,
                        color: Colors.red,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              news_provider.listTest[index].title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              news_provider.listTest[index].author.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 12.0),
                            ),
                            Text(
                              news_provider.listTest[index].description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Text('No data'));
  }
}
