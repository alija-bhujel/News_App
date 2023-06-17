import 'package:flutter/cupertino.dart';

class Newsart {
  String imgurl;
  String newshead;
  String newsdesc;
  String newscnt;
  String newsurl;

  Newsart({
    required this.imgurl,
    required this.newshead,
    required this.newsdesc,
    required this.newscnt,
    required this.newsurl,
  });

  static Newsart fromAPItoApp(Map<String, dynamic> article) {
    //easy to fetch the data
    return Newsart(
      imgurl: article["urlToImage"] ??
          "https://img.freepik.com/free-vector/realistic-news-studio-background_52683-103246.jpg?w=900&t=st=1682512254~exp=1682512854~hmac=65d3f5942603b147cdee6153780280053a6f61dba1f87c5ab48dd1c4a8a43e6c",
      newshead: article["title"] ?? "--",
      newsdesc: article["description"] ?? "--",
      newscnt: article["content"] ?? "--",
      newsurl: article["url"] ??
          "https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en",
    );
  } //takes data from api and give the app
}
