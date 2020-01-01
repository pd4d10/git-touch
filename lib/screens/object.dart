import 'package:flutter/cupertino.dart';
import 'package:flutter_highlight/theme_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:git_touch/graphql/github_object.dart';
import 'package:git_touch/models/code.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/scaffolds/refresh_stateful.dart';
import 'package:git_touch/widgets/action_entry.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/markdown_view.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:git_touch/models/auth.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:primer/primer.dart';
import 'package:seti/seti.dart';

final objectRouter = RouterScreen(
  '/:owner/:name/blob/:ref',
  (context, params) => ObjectScreen(
    params['owner'].first,
    params['name'].first,
    params['ref'].first,
    paths: params['path']?.first?.urldecode?.split('/') ?? [],
  ),
);

class ObjectScreen extends StatelessWidget {
  final String owner;
  final String name;
  final String branch;
  final List<String> paths;

  ObjectScreen(this.owner, this.name, this.branch, {this.paths = const []});

  String get _expression => '$branch:$_path';
  String get _extname {
    if (paths.isEmpty) return '';
    var dotext = p.extension(paths.last);
    if (dotext.isEmpty) return '';
    return dotext.substring(1);
  }

  String get _language => _extname.isEmpty ? 'plaintext' : _extname;
  String get _path => paths.join('/');
  bool get _isImage => ['png', 'jpg', 'jpeg', 'gif', 'webp'].contains(_extname);

  String get rawUrl =>
      'https://raw.githubusercontent.com/$owner/$name/$branch/$_path'; // TODO:

  static const _iconDefaultColor = PrimerColors.blue300;

  Widget _buildIcon(GithubObjectTreeEntry item) {
    switch (item.type) {
      case 'blob':
        return SetiIcon(item.name, size: 36);
      case 'tree':
      case 'commit':
        return Icon(
          item.type == 'tree'
              ? Octicons.file_directory
              : Octicons.file_submodule,
          color: _iconDefaultColor,
          size: 24,
        );
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshStatefulScaffold<GithubObjectGitObject>(
      canRefresh: !_isImage,
      title: AppBarTitle(_path.isEmpty ? 'Files' : _path),
      fetchData: () async {
        final res = await Provider.of<AuthModel>(context)
            .gqlClient
            .execute(GithubObjectQuery(
              variables: GithubObjectArguments(
                owner: owner,
                name: name,
                expression: _expression,
              ),
            ));
        final data = res.data.repository.object;

        if (data.resolveType == 'Tree') {
          (data as GithubObjectTree).entries.sort((a, b) {
            if (a.type == 'tree' && b.type == 'blob') {
              return -1;
            }
            if (a.type == 'blob' && b.type == 'tree') {
              return 1;
            }
            return 0;
          });
        }

        return data;
      },
      actionBuilder: (data, _) {
        switch (data.resolveType) {
          case 'Blob':
            final blob = data as GithubObjectBlob;
            return ActionEntry(
              iconData: Octicons.settings,
              onTap: () {
                // TODO:
                // if (data != null) {
                //   Provider.of<ThemeModel>(context).pushRoute(
                //       context, (_) => CodeThemeScreen(blob.text, _language));
                // }
              },
            );
          default:
            return null;
        }
      },
      bodyBuilder: (data, _) {
        switch (data.resolveType) {
          case 'Tree':
            final tree = data as GithubObjectTree;

            return TableView(
              hasIcon: true,
              items: tree.entries.map((item) {
                // if (item.type == 'commit') return null;
                final p = [...paths, item.name].join('/').urlencode;
                final url = '/$owner/$name/blob/$branch?path=$p';

                return TableViewItem(
                  leftWidget: _buildIcon(item),
                  text: Text(item.name),
                  url: url,
                );
              }),
            );
          case 'Blob':
            final codeProvider = Provider.of<CodeModel>(context);
            final theme = Provider.of<ThemeModel>(context);
            final text = (data as GithubObjectBlob).text;

            switch (_extname) {
              // TODO: All image types
              case 'png':
              case 'jpg':
              case 'jpeg':
              case 'gif':
              case 'webp':
                return PhotoView(
                  imageProvider: NetworkImage(rawUrl),
                  backgroundDecoration:
                      BoxDecoration(color: theme.palette.background),
                );
              case 'md':
              case 'markdown':
                return Padding(
                  padding: CommonStyle.padding,
                  child: MarkdownView(text,
                      basePaths: [owner, name, branch, ...paths]),
                );
              case 'svg':
                return SvgPicture.network(rawUrl);
              default:
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: HighlightView(
                    text,
                    language: _language,
                    theme: themeMap[codeProvider.theme],
                    padding: CommonStyle.padding,
                    textStyle: TextStyle(
                        fontSize: codeProvider.fontSize.toDouble(),
                        fontFamily: codeProvider.fontFamilyUsed),
                  ),
                );
            }
            break;
          default:
            return null;
        }
      },
    );
  }
}
