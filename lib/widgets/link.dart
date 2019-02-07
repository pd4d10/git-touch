import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../providers/settings.dart';

class Link extends StatelessWidget {
  final Widget child;
  final WidgetBuilder screenBuilder;
  final Function beforeRedirect;
  final Color bgColor;

  Link({
    @required this.child,
    this.screenBuilder,
    this.beforeRedirect,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    var theme = SettingsProvider.of(context).theme;
    return Material(
      child: Ink(
        color: bgColor ?? Colors.white,
        child: InkWell(
          child: child,
          splashColor: theme == ThemeMap.cupertino ? Colors.transparent : null,
          onTap: () {
            if (beforeRedirect != null) {
              beforeRedirect();
            }

            if (screenBuilder != null) {
              switch (theme) {
                case ThemeMap.cupertino:
                  Navigator.of(context)
                      .push(CupertinoPageRoute(builder: screenBuilder));
                  break;
                default:
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: screenBuilder));
              }
            }
          },
        ),
      ),
    );
  }
}
