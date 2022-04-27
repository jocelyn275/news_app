import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/model/article_model.dart';

class ApiService {
  final endPointUrl = 'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=20e53df2f9124fcf8375870fc9ae1d75';

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));

    // check if theres a 200 status code: this means that the request was a success
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      // This line allows us to get the different articles from the json file and putting them into a list
      List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ('Can\'t get the articles');
    }
  }
}
