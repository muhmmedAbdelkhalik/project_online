import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/view/widget/news_widget.dart';

class DetailsView extends StatelessWidget {
  final NewsModel article;
  const DetailsView({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "News Details",
          style: TextStyle(color: Colors.redAccent),
        ),
      ),
      body: Column(
        children: [
          NewsWidget(article: article),
          TextButton(
            onPressed: () {
              NewsService().addNewPost();
            },
            child: const Text("POST Method"),
          ),
          TextButton(
            onPressed: () {
              NewsService().deletePost();
            },
            child: const Text("DELETE Method"),
          ),
          TextButton(
            onPressed: () {
              NewsService().putOldPost();
            },
            child: const Text("PUT Method"),
          )
        ],
      ),
    );
  }
}
