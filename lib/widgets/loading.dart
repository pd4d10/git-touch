import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/theme.dart';
import 'package:provider/provider.dart';

class Loading extends StatelessWidget {
  final bool more;

  Loading({this.more = false});

  Widget _buildIndicator(BuildContext context) {
    // return Image.asset('images/loading.webp');

    switch (Provider.of<ThemeModel>(context).theme) {
      case AppThemeType.cupertino:
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
        padding: EdgeInsets.symmetric(vertical: 50),
        child: _buildIndicator(context),
      );
    }
  }
}
