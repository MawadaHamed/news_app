import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/api_service.dart';
import 'package:flutter_application_1/news/news_item.dart';
import 'package:flutter_application_1/widget/error_indicator.dart';
import 'package:flutter_application_1/widget/loading_indicator.dart';

class NewsList extends StatelessWidget {
  const NewsList(this.sourceId, {super.key});

  final String sourceId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.getNews(sourceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return const ErrorIndicator();
        } else {
          final newsList = snapshot.data?.news ?? [];
          return ListView.builder(
            itemBuilder: (_, index) => NewsItem(newsList[index]),
            itemCount: newsList.length,
          );
        }
      },
    );
  }
}
