import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/view/details_view.dart';
import 'package:news_app/view/widget/news_widget.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  late Future<List<NewsModel>> _newsArticles;

  @override
  void initState() {
    _newsArticles = NewsService().fetchNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hot updates",
          style: TextStyle(color: Colors.redAccent),
        ),
      ),
      body: FutureBuilder(
        future: _newsArticles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Failed to load news api"));
          } else if (snapshot.data!.isEmpty) {
            return const Center(child: Text("No news found"));
          } else {
            final articles = snapshot.data;
            return ListView.builder(
              itemCount: articles?.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (articles?[index] != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsView(
                            article: articles![index],
                          ),
                        ),
                      );
                    }
                  },
                  child: NewsWidget(article: articles?[index]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
