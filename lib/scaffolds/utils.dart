import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:git_touch/widgets/loading.dart';
import 'package:provider/provider.dart';

class CommonScaffold extends StatelessWidget {
  final Widget title;
  final Widget body;
  final Widget trailing;
  final PreferredSizeWidget bottom;

  CommonScaffold({
    @required this.title,
    @required this.body,
    this.trailing,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    switch (Provider.of<ThemeModel>(context).theme) {
      case AppThemeType.cupertino:
        return CupertinoPageScaffold(
          navigationBar:
              CupertinoNavigationBar(middle: title, trailing: trailing),
          child: SafeArea(child: body),
        );
      default:
        return Scaffold(
          appBar: AppBar(
            title: title,
            actions: [
              if (trailing != null) trailing,
            ],
            bottom: bottom,
          ),
          body: body,
        );
    }
  }
}

class RefreshWrapper extends StatelessWidget {
  final Widget body;
  final void Function() onRefresh;

  RefreshWrapper({
    @required this.onRefresh,
    @required this.body,
  });

  @override
  Widget build(BuildContext context) {
    switch (Provider.of<ThemeModel>(context).theme) {
      case AppThemeType.cupertino:
        return CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverRefreshControl(onRefresh: onRefresh),
            SliverToBoxAdapter(child: body),
          ],
        );
      default:
        return RefreshIndicator(
          onRefresh: onRefresh,
          child: SingleChildScrollView(child: body),
        );
    }
  }
}

class ErrorLoadingWrapper extends StatelessWidget {
  final String error;
  final bool loading;
  final void Function() reload;
  final Widget Function() bodyBuilder;

  ErrorLoadingWrapper({
    @required this.error,
    @required this.loading,
    @required this.reload,
    @required this.bodyBuilder,
  });

  @override
  Widget build(BuildContext context) {
    if (error.isNotEmpty) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          children: <Widget>[
            Text(
              'Woops, something bad happened. Error message:',
              style: TextStyle(fontSize: 16),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              error,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.redAccent,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Link(
              child: Text(
                'Reload',
                style: TextStyle(fontSize: 20, color: Colors.blueAccent),
              ),
              onTap: reload,
              material: false,
            ),
          ],
        ),
      );
    }

    if (loading) {
      return Loading();
    }

    return bodyBuilder();
  }
}

Widget wrapBuilder(Widget Function() builder) {
  if (builder == null) return null;
  return builder();
}
