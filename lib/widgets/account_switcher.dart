import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';
import '../models/theme.dart';
import '../utils/utils.dart';
import 'avatar.dart';
import 'link.dart';

class AccountSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    final auth = Provider.of<AuthModel>(context);
    return Container(
        color: theme.palette.background,
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: CommonStyle.padding,
                  child: Row(children: [
                    Text("Switch Accounts",
                        style: TextStyle(
                          color: theme.palette.text,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        )),
                    Spacer(),
                    Link(
                      child: Text("Manage"),
                      onTap: () {
                        Navigator.of(context).pop();
                        theme.push(context, "/login");
                      },
                    )
                  ])),
              Divider(height: 2, color: theme.palette.border),
              ...auth.accounts
                  .asMap()
                  .map<int, Widget>((index, account) {
                    return MapEntry(
                        index,
                        Link(
                            onTap: () {
                              if (auth.activeAccount != account) {
                                auth.setActiveAccountAndReload(index);
                              } else {
                                Navigator.of(context).pop();
                              }
                            },
                            child: Container(
                              padding: CommonStyle.padding,
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: theme.palette.border)),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Avatar(url: account.avatarUrl, size: AvatarSize.large),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          account.login,
                                          style: TextStyle(fontSize: 20, color: theme.palette.text),
                                        ),
                                        Padding(padding: EdgeInsets.only(top: 6)),
                                        Text(
                                          account.domain,
                                          style: TextStyle(color: theme.palette.secondaryText),
                                        )
                                      ],
                                    ),
                                  ),
                                  (index == auth.activeAccountIndex)
                                      ? Icon(Icons.check)
                                      : Container(),
                                ],
                              ),
                            )));
                  })
                  .values
                  .toList()
            ],
          ),
        ));
  }
}
