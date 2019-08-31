import 'package:flutter/material.dart';
import 'package:git_touch/scaffolds/simple.dart';

class ImageView extends StatelessWidget {
  final ImageProvider imageProvider;

  ImageView(this.imageProvider);

  @override
  Widget build(BuildContext context) {
    return SimpleScaffold(
      title: Text('Image preview'),
      bodyBuilder: () {
        return Container(
          child: Image(image: imageProvider),
        );
      },
    );
  }
}
