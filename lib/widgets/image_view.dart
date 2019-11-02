import 'package:flutter/material.dart';
import 'package:git_touch/scaffolds/common.dart';
import 'package:photo_view/photo_view.dart';

class ImageView extends StatelessWidget {
  final String url;

  ImageView(this.url);

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: Text('Image'),
      body: PhotoView(
        imageProvider: NetworkImage(url),
        backgroundDecoration: BoxDecoration(color: Colors.white),
      ),
    );
  }
}
