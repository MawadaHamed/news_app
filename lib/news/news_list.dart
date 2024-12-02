import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/api_service.dart';
import 'package:flutter_application_1/models/news_response/article.dart';
import 'package:flutter_application_1/widget/loading_indicator.dart';
import 'package:flutter_application_1/news/news_item.dart';

class NewsList extends StatefulWidget {
  const NewsList(this.sourceId, {Key? key}) : super(key: key);

  final String sourceId;

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  List<Article> _articles = [];
  bool _isLoading = false;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    if (_isLoading || !_hasMore) return;

    setState(() {
      _isLoading = true;
    });

    final response = await ApiService.getNews(widget.sourceId);
    if (response?.status == 'ok') {
      setState(() {
        _articles.addAll(response.articles ?? []);
        _hasMore = response.articles?.isNotEmpty ?? false;
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
        _hasMore = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.pixels ==
                notification.metrics.maxScrollExtent &&
            notification is ScrollEndNotification) {
          fetchArticles();
        }
        return true;
      },
      child: ListView.builder(
        itemCount: _articles.length + (_isLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == _articles.length) {
            return LoadingIndicator();
          }
          return NewsItem(_articles[index]);
        },
      ),
    );
  }
}
