//https://newsapi.org/v2/everything?q=tesla&from=2023-03-26&sortBy=publishedAt&apiKey=8ad4519e011c475f8f002810c1ee6223
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';
import 'package:news_app/models/newsart.dart';

class FetchNews {
  static List sourcesId = [
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",
    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",
    "medical-news-today",
    "national-geographic",
    "news24",
    "new-scientist",
    "new-york-magazine",
    "next-big-future",
    "techcrunch",
    "techradar",
    "the-hindu",
    "the-wall-street-journal",
    "the-washington-times",
    "time",
    "usa-today",
  ];
  static Future<Newsart> fetchNews() async {
    final _random = new Random();
    var element = sourcesId[_random.nextInt(sourcesId.length)];
    print(element);
    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=$element&apiKey=8ad4519e011c475f8f002810c1ee6223"));

    Map body_data = jsonDecode(response.body);
    List articles = body_data["articles"];
    print(body_data);

    final _Newrandom = new Random();
    var myArticle = articles[_random.nextInt(articles.length)];
    print(myArticle);

    return Newsart.fromAPItoApp(myArticle);
  }
}
