import 'package:flutter/material.dart';
import 'package:git_touch/scaffolds/simple.dart';
import 'package:git_touch/widgets/app_bar_title.dart';

class ImageView extends StatelessWidget {
  final ImageProvider imageProvider;

  ImageView(this.imageProvider);

  @override
  Widget build(BuildContext context) {
    return SimpleScaffold(
      title: AppBarTitle('Image preview'),
      bodyBuilder: () {
        return Container(
          child: Image(image: imageProvider),
        );
      },
    );
  }
}
