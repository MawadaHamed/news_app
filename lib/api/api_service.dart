import 'dart:convert';

import 'package:flutter_application_1/api/api_constants.dart';
import 'package:flutter_application_1/models/news_response/news_response.dart';
import 'package:flutter_application_1/models/sources_response/sources_response.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<SourcesResponse> getSources(String categoryId) async {
    final uri = Uri.https(
      ApiConstants.baseURL,
      ApiConstants.sourcesEndpoint,
      {
        'apiKey': ApiConstants.apiKey,
        'category': categoryId,
      },
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return SourcesResponse.fromJson(json);
  }

  static Future getNews(String sourceId) async {
    final uri = Uri.https(ApiConstants.baseURL, ApiConstants.newsEndpoint, {
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
    });
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
