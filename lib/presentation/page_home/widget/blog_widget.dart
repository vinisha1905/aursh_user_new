import 'package:ayursh/domain/model/response/blog_model.dart';
import 'package:flutter/material.dart';

class BlogWidget extends StatelessWidget {
  final BlogModel blogModel;

  BlogWidget(this.blogModel);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          blogModel.smallPhoto,
          width: 220,
          fit: BoxFit.fill,
        ));
  }
}
