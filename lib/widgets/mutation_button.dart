import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/theme.dart';
import 'package:provider/provider.dart';

class MutationButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  MutationButton({
    @required this.text,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    return CupertinoButton(
      onPressed: onPressed,
      minSize: 0,
      color: theme.paletteOf(context).primary,
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 17,
          color: theme.paletteOf(context).background,
        ),
      ),
    );
  }
}
