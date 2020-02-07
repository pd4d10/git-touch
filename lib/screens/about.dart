// import 'package:flutter/material.dart';
// import 'package:git_touch/models/theme.dart';
// import 'package:git_touch/scaffolds/single.dart';
// import 'package:git_touch/widgets/app_bar_title.dart';
// import 'package:git_touch/widgets/table_view.dart';
// import 'package:launch_review/launch_review.dart';
// import 'package:package_info/package_info.dart';
// import 'package:provider/provider.dart';

// /// Unused
// class AboutScreen extends StatefulWidget {
//   @override
//   _AboutScreenState createState() => _AboutScreenState();
// }

// class _AboutScreenState extends State<AboutScreen> {
//   var _version = '';

//   @override
//   void initState() {
//     super.initState();
//     PackageInfo.fromPlatform().then((info) {
//       setState(() {
//         _version = info.version;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Provider.of<ThemeModel>(context);
//     return SingleScaffold(
//       title: AppBarTitle('About'),
//       body: Column(
//         children: <Widget>[
//           SizedBox(height: 32),
//           ClipRRect(
//             borderRadius: BorderRadius.circular(24),
//             child: Image.asset(
//               'images/icon.png',
//               width: 96,
//             ),
//           ),
//           SizedBox(height: 12),
//           Text(
//             'GitTouch',
//             style: TextStyle(fontSize: 20, color: theme.palette.text),
//           ),
//           SizedBox(height: 48),
//           TableView(items: [
//             TableViewItem(text: Text('Version'), rightWidget: Text(_version)),
//             TableViewItem(text: Text('Source Code'), url: '/pd4d10/git-touch'),
//             TableViewItem(
//                 text: Text('Feedback'), url: '/pd4d10/git-touch/issues/new'),
//             TableViewItem(
//               text: Text('Rate This App'),
//               onTap: () {
//                 LaunchReview.launch(
//                   androidAppId: 'io.github.pd4d10.gittouch',
//                   iOSAppId: '1452042346',
//                 );
//               },
//             ),
//           ]),
//         ],
//       ),
//     );
//   }
// }
