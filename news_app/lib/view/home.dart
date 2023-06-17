import 'package:flutter/material.dart';
import 'package:news_app/models/newsart.dart';
import 'package:news_app/view/controller/fetchdata.dart';
import 'package:news_app/view/widget/NewsContainer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool isLoading = true;
  late Newsart newsart;

  getNews() async {
    newsart = await FetchNews.fetchNews();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getNews();
    //FetchNews.fetchNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: PageController(initialPage: 2),
          scrollDirection: Axis.vertical,
          //itemCount: 100,
          onPageChanged: (value) {
            setState(() {
              isLoading = true;
            });
            getNews();
          },
          itemBuilder: ((context, index) {
            FetchNews.fetchNews();

            return isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : NewsContainer(
                    imgurl: newsart.imgurl,
                    //"https://media.istockphoto.com/id/1440979913/photo/view-of-stacked-newspapers-on-blurred-background.jpg?s=612x612&w=is&k=20&c=fK1qsNHcnKBpf9wApg1O793stG8sxD33xKOesI2p1YU=",
                    newshead: newsart.newshead,
                    // "News on Economic Growth",
                    newsdesc: newsart.newsdesc,
                    //"Important topic on Economic growth and development",
                    newscnt: newsart.newscnt,
                    // "Economic growth is usually distinguished from economic development, the latter term being restricted to economies that are close to the subsistence level. The term economic growth is applied to economies already experiencing rising per capita incomes. In Rostow’s phraseology economic growth begins somewhere between the stage of take-off and the stage of maturity; or in Clark’s terms, between the stage dominated by primary and the stage dominated by secondary production. The most striking aspect in such development is generally the enormous decrease in the proportion of the labour force employed in agriculture. There are other aspects of growth. The decline in agriculture and the rise of industry and services has led to concentration of the population in cities, first in what has come to be described as the “core city” and later in the suburbs. In earlier years public utility investment (including investment in transportation) was more important than manufacturing investment, but in the course of growth this relationship was reversed. There has also been a rise in the importance of durable consumer goods in total output. In the U.S. experience, the rate of growth of capital goods production at first exceeded the rate of growth of total output, but later this too was reversed. Likewise, business construction or plant expenditures loomed large in the earlier period as an object of business investment compared to the recent era. Whether other countries will go through the same experience at similar stages in their growth remains to be seen.",
                    newsurl: newsart.newsurl);
            //"https://www.britannica.com/topic/economic-development/Economic-development-as-an-objective-of-policy");
          })),
    );
  }
}
