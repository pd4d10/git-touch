import 'package:flutter/material.dart';
import '../scaffolds/simple.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SimpleScaffold(
      title: Text('Settings'),
      bodyBuilder: () {
        return Text('body');
      },
    );
  }
}
