import 'dart:html';
import 'dart:ui';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:news_app/view/detail_view.dart';

class NewsContainer extends StatelessWidget {
  String imgurl;
  String newshead;
  String newsdesc;
  String newsurl;
  String newscnt;
  NewsContainer({
    super.key,
    required this.imgurl,
    required this.newshead,
    required this.newsdesc,
    required this.newsurl,
    required this.newscnt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInImage.assetNetwork(
              height: 300,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              placeholder: "/assets/images/breaking news.png",
              image: imgurl),
          Image.network(
              height: 200,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              imgurl),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  newshead.length > 70
                      ? "${newshead.substring(0, 70)}"
                      : newshead,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  newsdesc,
                  style: TextStyle(fontSize: 16, color: Colors.black38),
                ),
                SizedBox(height: 10),
                Text(
                  newscnt != "--"
                      ? newscnt.length > 200
                          ? newscnt.substring(0, 200)
                          : "${newscnt.toString().substring(0, newscnt.length - 15)}..."
                      : newscnt, //make string to remove last terms like (4050+....at news)
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Detail_screen(newsurl: newsurl)));
                  },
                  child: Text('Read More'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
