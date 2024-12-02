import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/api_service.dart';
import 'package:flutter_application_1/app_theme.dart';
import 'package:flutter_application_1/models/news_response/article.dart';
import 'package:flutter_application_1/news/news_item.dart';
import 'package:flutter_application_1/widget/error_indicator.dart';
import 'package:flutter_application_1/widget/loading_indicator.dart';

class SearchTab extends SearchDelegate {
  final String sourceId;
  List<Article> articles = [];

  SearchTab(this.sourceId);

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData lightTheme = Theme.of(context);

    return lightTheme.copyWith(
        hintColor: AppTheme.white,
        inputDecorationTheme: InputDecorationTheme(border: InputBorder.none),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: AppTheme.primary,
        ));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredArticles = articles
        .where((article) =>
            article.title?.toLowerCase().contains(query.toLowerCase()) ?? false)
        .toList();

    if (filteredArticles.isEmpty) {
      return Center(
        child: Text('No News found.'),
      );
    } else {
      return ListView.builder(
        itemCount: filteredArticles.length,
        itemBuilder: (_, index) {
          return NewsItem(filteredArticles[index]);
        },
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: ApiService.getNews(sourceId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingIndicator();
          } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
            return const ErrorIndicator();
          } else {
            articles = snapshot.data?.articles ?? [];

            final suggestedArticles = articles
                .where((article) =>
                    article.title
                        ?.toLowerCase()
                        .contains(query.toLowerCase()) ??
                    false)
                .toList();

            return ListView.builder(
              itemCount: suggestedArticles.length,
              itemBuilder: (_, index) {
                return NewsItem(suggestedArticles[index]);
              },
            );
          }
        });
  }
}
