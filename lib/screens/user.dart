import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/loading.dart';
import '../providers/settings.dart';
import '../utils/utils.dart';

Future queryUser(String login) async {
  var data = await query('''
{
  user(login: "$login") {
    name
    avatarUrl
    bio
    email
    repositories {
      totalCount
    }
    starredRepositories {
      totalCount
    }
    followers {
      totalCount
    }
    following {
      totalCount
    }
  }
}
''');
  return data['user'];
}

final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    new GlobalKey<RefreshIndicatorState>();

class UserScreen extends StatefulWidget {
  final String login;

  UserScreen(this.login);

  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  var payload;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Future _refresh() async {
    queryUser(widget.login).then((_payload) {
      setState(() {
        payload = _payload;
      });
    });
  }

  Widget _buildBody(BuildContext context) {
    if (payload == null) {
      return Loading(more: false);
    }
    return Text('loaded');

    // return SafeArea(
    //   child: CupertinoSliverRefreshControl(
    //     // key: _refreshIndicatorKey,
    //     onRefresh: _refresh,
    //     child: Column(
    //       children: <Widget>[
    //         Container(
    //           margin: EdgeInsets.symmetric(vertical: 20.0),
    //           child: ClipOval(
    //             child: Image.network(
    //               payload['avatarUrl'],
    //               fit: BoxFit.fill,
    //               width: 64,
    //               height: 64,
    //             ),
    //           ),
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: <Widget>[
    //             GestureDetector(
    //               child: Column(
    //                 children: <Widget>[
    //                   Text(payload['followers']['totalCount'].toString()),
    //                   Text('Followers'),
    //                 ],
    //               ),
    //               onTap: () {
    //                 // print(1);
    //               },
    //             ),
    //             Column(
    //               children: <Widget>[
    //                 Text(payload['following']['totalCount'].toString()),
    //                 Text('Following')
    //               ],
    //             )
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    switch (SettingsProvider.of(context).layout) {
      case LayoutMap.cupertino:
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(middle: Text(widget.login)),
          child: _buildBody(context),
        );

      default:
        return Scaffold(appBar: AppBar(title: Text(widget.login)));
    }
  }
}
