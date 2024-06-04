import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/S.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:git_touch/scaffolds/list_stateful.dart';
import 'package:git_touch/widgets/avatar.dart';
import 'package:git_touch/widgets/markdown_view.dart';
import 'package:gql_github/releases.data.gql.dart';
import 'package:timeago/timeago.dart' as timeago;

class ReleaseItem extends StatefulWidget {
  const ReleaseItem({
    required this.login,
    required this.publishedAt,
    required this.name,
    required this.tagName,
    required this.avatarUrl,
    required this.description,
    this.releaseAssets,
  });
  final String? login;
  final DateTime? publishedAt;
  final String? name;
  final String? avatarUrl;
  final String? tagName;
  final String? description;
  final GReleasesData_repository_releases_nodes_releaseAssets? releaseAssets;

  @override
  State<ReleaseItem> createState() => _ReleaseItemState();
}

class _ReleaseItemState extends State<ReleaseItem> {
  var _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        Row(children: <Widget>[
          Avatar(url: widget.avatarUrl, size: AvatarSize.large),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      widget.tagName!,
                      style: TextStyle(
                        color: AntTheme.of(context).colorPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                DefaultTextStyle(
                  style: TextStyle(
                    color: AntTheme.of(context).colorTextSecondary,
                    fontSize: 16,
                  ),
                  child: Text(
                      '${widget.login!} ${AppLocalizations.of(context)!.released} ${timeago.format(widget.publishedAt!)}'),
                ),
              ],
            ),
          ),
        ]),
        if (widget.description != null && widget.description!.isNotEmpty) ...[
          MarkdownFlutterView(
            widget.description,
          ),
          const SizedBox(height: 10),
        ],
        AntCollapse(
          activeKey: _isExpanded ? {''} : {},
          onChange: (_) {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          panels: [
            AntCollapsePanel(
              key: '',
              title:
                  Text('Assets (${widget.releaseAssets?.nodes?.length ?? 0})'),
              child: AntList(
                children: [
                  if (widget.releaseAssets != null)
                    for (var asset in widget.releaseAssets!.nodes!)
                      AntListItem(
                        arrow: const Icon(Ionicons.download_outline),
                        child: Text(
                          asset.name,
                          style: TextStyle(
                            color: AntTheme.of(context).colorPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onClick: () {
                          context.pushUrl(asset.downloadUrl);
                        },
                      ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
