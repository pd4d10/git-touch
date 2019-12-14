import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/gitlab.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/blob_view.dart';
import 'package:provider/provider.dart';

final gitlabBlobRouter = RouterScreen(
    '/projects/:id/tree',
    (context, params) => GitlabBlobScreen(params['id'].first.toInt,
        path: params['path']?.first?.urldecode));

class GitlabBlobScreen extends StatelessWidget {
  final int id;
  final String path;

  GitlabBlobScreen(this.id, {this.path});

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<GitlabBlob>(
      title: AppBarTitle(path),
      fetchData: () async {
        final encodedPath = Uri.encodeComponent(path);
        final res = await Provider.of<AuthModel>(context).fetchGitlab(
            '/projects/$id/repository/files/$encodedPath?ref=master'); // TODO:
        return GitlabBlob.fromJson(res);
      },
      bodyBuilder: (data, _) {
        return BlobView(path, utf8.decode(base64.decode(data.content)));
      },
    );
  }
}
