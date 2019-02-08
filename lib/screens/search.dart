import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../providers/settings.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int active = 0;
  List users = [];

  @override
  Widget build(BuildContext context) {
    switch (SettingsProvider.of(context).theme) {
      case ThemeMap.cupertino:
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: CupertinoTextField(
              placeholder: 'Type to search',
              onChanged: (String value) {
                //
              },
              onSubmitted: (String value) {
                //
              },
            ),
          ),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                CupertinoSegmentedControl(
                  children: {0: Text('Repos'), 1: Text('Users')},
                  onValueChanged: (int value) {
                    //
                  },
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    var user = users[index];
                    return Row(
                      children: <Widget>[
                        Image.network(user['avatarUrl']),
                        Text(user['login']),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );

      default:
        return Scaffold(
          appBar: AppBar(title: Text('Search')),
          body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) => Text(''),
          ),
        );
    }
  }
}
