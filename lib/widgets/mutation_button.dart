import 'package:antd_mobile/antd_mobile.dart';
import 'package:flutter/cupertino.dart';

class MutationButton extends StatelessWidget {
  const MutationButton({
    super.key,
    this.active = true,
    required this.text,
    required this.onTap,
  });
  final bool active;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AntButton(
      color: AntTheme.of(context).colorPrimary,
      fill: active ? AntButtonFill.solid : AntButtonFill.outline,
      shape: AntButtonShape.rounded,
      onClick: onTap,
      child: Text(text),
    );
  }
}
