import 'package:flutter/material.dart';
import 'package:git_touch/scaffolds/single.dart';
import 'package:git_touch/widgets/app_bar_title.dart';

class ImageView extends StatelessWidget {
  final ImageProvider imageProvider;

  ImageView(this.imageProvider);

  @override
  Widget build(BuildContext context) {
    return SingleScaffold(
      title: AppBarTitle('Image preview'),
      body: Container(
        child: Image(image: imageProvider),
      ),
    );
  }
}
