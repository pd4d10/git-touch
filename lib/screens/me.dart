import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/settings.dart';
import 'package:provider/provider.dart';
import '../screens/user.dart';

class MeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserScreen(
      Provider.of<SettingsModel>(context).activeLogin,
      showSettings: true,
    );
  }
}
