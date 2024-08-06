import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({
    super.key,
    required this.article,
  });

  final NewsModel? article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade300,
              image: DecorationImage(
                  image: NetworkImage(article?.urlToImage ?? 'https://via.placeholder.com/150'), fit: BoxFit.cover),
            ),
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(article?.publishedAt ?? '', style: const TextStyle(fontSize: 12)),
          ),
          Text(
            article?.title ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            article?.description ?? '',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Published by: ${article?.author ?? ''}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
