import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../providers/settings.dart';

class Loading extends StatelessWidget {
  final bool more;

  Loading({this.more});

  Widget _buildIndicator(BuildContext context) {
    switch (SettingsProvider.of(context).theme) {
      case ThemeMap.cupertino:
        return CupertinoActivityIndicator(radius: 12);
      default:
        return Center(
          child: SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (more) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: _buildIndicator(context),
      );
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: _buildIndicator(context),
      );
    }
  }
}
