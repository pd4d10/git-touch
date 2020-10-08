import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/widgets/link.dart';
import 'package:provider/provider.dart';

class MutationButton extends StatelessWidget {
  final bool active;
  final String text;
  final String url;
  final VoidCallback onTap;

  MutationButton({
    @required this.active,
    @required this.text,
    this.url,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    final textColor = active ? theme.palette.background : theme.palette.primary;
    final backgroundColor =
        active ? theme.palette.primary : theme.palette.background;
    return Link(
      url: url,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: theme.palette.primary),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 17, color: textColor),
        ),
      ),
    );
  }
}
