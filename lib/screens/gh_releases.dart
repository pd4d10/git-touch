import 'package:flutter/material.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/graphql/github.var.gql.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/release_item.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/graphql/github.data.gql.dart';
import 'package:git_touch/graphql/github.req.gql.dart';

class GhReleasesScreen extends StatelessWidget {
  final String owner;
  final String name;
  GhReleasesScreen(this.owner, this.name);

  @override
  Widget build(BuildContext context) {
    return ListStatefulScaffold<GReleasesData_repository_releases_nodes,
        String?>(
      title: AppBarTitle("Releases"),
      fetch: (page) async {
        final req = GReleasesReq((b) => b
          ..vars.owner = owner
          ..vars.name = name
          ..vars.cursor = page);
        final OperationResponse<GReleasesData, GReleasesVars?> res =
            await context.read<AuthModel>().gqlClient!.request(req).first;
        final releases = res.data!.repository!.releases;
        return ListPayload(
          cursor: releases.pageInfo.endCursor,
          items: releases.nodes,
          hasMore: releases.pageInfo.hasNextPage,
        );
      },
      itemBuilder: (v) {
        return ReleaseItem(
          tagName: v.tagName,
          publishedAt: v.publishedAt,
          avatarUrl: v.author!.avatarUrl,
          login: v.author!.name,
          name: v.name,
          description: v.description,
          releaseAssets: v.releaseAssets,
        );
      },
    );
  }
}
