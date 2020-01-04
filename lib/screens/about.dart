import 'package:flutter/material.dart';
import 'package:git_touch/scaffolds/single.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:git_touch/widgets/app_bar_title.dart';
import 'package:git_touch/widgets/table_view.dart';
import 'package:launch_review/launch_review.dart';
import 'package:package_info/package_info.dart';

final aboutRouter = RouterScreen(
  '/about',
  (context, parameters) {
    return AboutScreen();
  },
);

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  var _version = '';

  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then((info) {
      setState(() {
        _version = info.version;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleScaffold(
      title: AppBarTitle('About'),
      body: Column(
        children: <Widget>[
          SizedBox(height: 32),
          Image.asset(
            'images/icon.png',
            width: 96,
          ),
          SizedBox(height: 64),
          TableView(items: [
            TableViewItem(text: Text('Version'), rightWidget: Text(_version)),
            TableViewItem(text: Text('Source Code'), url: '/pd4d10/git-touch'),
            TableViewItem(
                text: Text('Feedback'), url: '/pd4d10/git-touch/issues/new'),
            TableViewItem(text: Text('Credits'), url: '/help/credits'),
            TableViewItem(
              text: Text('Rate This App'),
              onTap: () {
                LaunchReview.launch(
                  androidAppId: 'io.github.pd4d10.gittouch',
                  iOSAppId: '1452042346',
                );
              },
            ),
          ]),
        ],
      ),
    );
  }
}
