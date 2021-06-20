import 'package:flutter/material.dart';
import 'package:git_touch/utils/utils.dart';

enum IssueIconState {
  open,
  closed,
  prOpen,
  prClosed,
  prMerged,
}

class IssueIcon extends StatelessWidget {
  final IssueIconState state;
  final double? size;

  IssueIcon(this.state, {this.size});

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case IssueIconState.open:
        return Icon(Octicons.issue_opened,
            color: GithubPalette.open, size: size);
      case IssueIconState.closed:
        return Icon(Octicons.issue_closed,
            color: GithubPalette.closed, size: size);
      case IssueIconState.prOpen:
        return Icon(Octicons.git_pull_request,
            color: GithubPalette.open, size: size);
      case IssueIconState.prClosed:
        return Icon(Octicons.git_pull_request,
            color: GithubPalette.closed, size: size);
      case IssueIconState.prMerged:
        return Icon(Octicons.git_merge,
            color: GithubPalette.merged, size: size);
      default:
        return Container();
    }
  }
}
