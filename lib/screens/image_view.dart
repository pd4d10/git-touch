// import 'package:flutter/material.dart';
// import 'package:git_touch/models/theme.dart';
// import 'package:git_touch/scaffolds/common.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:provider/provider.dart';

// class ImageViewScreen extends StatelessWidget {
//   final String url;
//   final Widget title;

//   ImageViewScreen(this.url, {this.title = const Text('Image')});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Provider.of<ThemeModel>(context);

//     return CommonScaffold(
//       title: title,
//       body: PhotoView(
//         imageProvider: NetworkImage(url),
//         backgroundDecoration: BoxDecoration(color: theme.palette.background),
//       ),
//     );
//   }
// }
