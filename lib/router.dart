import 'package:fluro/fluro.dart';
import 'package:git_touch/screens/bb_commits.dart';
import 'package:git_touch/screens/bb_object.dart';
import 'package:git_touch/screens/bb_repo.dart';
import 'package:git_touch/screens/bb_user.dart';
import 'package:git_touch/screens/code_theme.dart';
import 'package:git_touch/screens/gh_commits.dart';
import 'package:git_touch/screens/gh_contributors.dart';
import 'package:git_touch/screens/gh_org_repos.dart';
import 'package:git_touch/screens/gl_commit.dart';
import 'package:git_touch/screens/gl_starrers.dart';
import 'package:git_touch/screens/gt_commits.dart';
import 'package:git_touch/screens/gt_issues.dart';
import 'package:git_touch/screens/gt_object.dart';
import 'package:git_touch/screens/gt_org.dart';
import 'package:git_touch/screens/gt_repo.dart';
import 'package:git_touch/screens/gt_user.dart';
import 'package:git_touch/screens/gl_blob.dart';
import 'package:git_touch/screens/gl_commits.dart';
import 'package:git_touch/screens/gl_group.dart';
import 'package:git_touch/screens/gl_issue.dart';
import 'package:git_touch/screens/gl_issues.dart';
import 'package:git_touch/screens/gl_members.dart';
import 'package:git_touch/screens/gl_merge_requests.dart';
import 'package:git_touch/screens/gl_project.dart';
import 'package:git_touch/screens/gl_tree.dart';
import 'package:git_touch/screens/gl_user.dart';
import 'package:git_touch/screens/gh_issue.dart';
import 'package:git_touch/screens/gh_issue_form.dart';
import 'package:git_touch/screens/gh_issues.dart';
import 'package:git_touch/screens/login.dart';
import 'package:git_touch/screens/gh_object.dart';
import 'package:git_touch/screens/gh_pulls.dart';
import 'package:git_touch/screens/gh_repos.dart';
import 'package:git_touch/screens/gh_repo.dart';
import 'package:git_touch/screens/settings.dart';
import 'package:git_touch/screens/gh_user.dart';
import 'package:git_touch/screens/gh_users.dart';

class RouterScreen {
  String path;
  HandlerFunc handler;
  RouterScreen(this.path, this.handler);
}

class CommonRouter {
  static const prefix = '';
  static final routes = [
    CommonRouter.codeTheme,
    CommonRouter.login,
    CommonRouter.settings
  ];
  static final codeTheme = RouterScreen('/choose-code-theme', (context, p) {
    return CodeThemeScreen();
  });
  static final login = RouterScreen('/login', (context, p) => LoginScreen());
  static final settings =
      RouterScreen('/settings', (context, parameters) => SettingsScreen());
}

class GithubRouter {
  static const prefix = ''; // TODO: '/github';
  static final routes = [
    GithubRouter.user,
    GithubRouter.repo,
    GithubRouter.issueAdd,
    GithubRouter.issues,
    GithubRouter.pulls,
    GithubRouter.issue,
    GithubRouter.pull,
    GithubRouter.commits,
    GithubRouter.object,
    GithubRouter.stargazers,
    GithubRouter.watchers,
    GithubRouter.contributors,
  ];
  static final user = RouterScreen('/:login', (_, p) {
    final login = p['login'].first;
    final tab = p['tab']?.first;
    switch (tab) {
      case 'followers':
        return GhUsersScreen(login, UsersScreenType.follower);
      case 'following':
        return GhUsersScreen(login, UsersScreenType.following);
      case 'people':
        return GhUsersScreen(login, UsersScreenType.member);
      case 'stars':
        return GhReposScreen.stars(login);
      case 'repositories':
        return GhReposScreen(login);
      case 'orgrepo':
        return GhOrgReposScreen(login);
      default:
        return GhUserScreen(login);
    }
  });
  static final repo = RouterScreen('/:owner/:name', (_, p) {
    if (p['ref'] == null) {
      return GhRepoScreen(p['owner'].first, p['name'].first);
    } else {
      return GhRepoScreen(p['owner'].first, p['name'].first,
          branch: p['ref'].first);
    }
  });
  static final issueAdd = RouterScreen('/:owner/:name/issues/new', (_, p) {
    return GhIssueFormScreen(p['owner'].first, p['name'].first);
  });
  static final issues = RouterScreen('/:owner/:name/issues',
      (context, p) => GhIssuesScreen(p['owner'].first, p['name'].first));
  static final pulls = RouterScreen('/:owner/:name/pulls',
      (context, p) => GhPullsScreen(p['owner'].first, p['name'].first));
  static final issue = RouterScreen(
      '/:owner/:name/issues/:number',
      (context, p) => GhIssueScreen(
          p['owner'].first, p['name'].first, int.parse(p['number'].first)));
  static final pull = RouterScreen(
      '/:owner/:name/pull/:number',
      (context, p) => GhIssueScreen(
          p['owner'].first, p['name'].first, int.parse(p['number'].first),
          isPullRequest: true));
  static final commits = RouterScreen('/:owner/:name/commits',
      (context, p) => GhCommitsScreen(p['owner'].first, p['name'].first));
  static final object = RouterScreen('/:owner/:name/blob/:ref', (_, p) {
    return GhObjectScreen(
      p['owner'].first,
      p['name'].first,
      p['ref'].first,
      path: p['path']?.first,
      raw: p['raw']?.first,
    );
  });
  static final stargazers = RouterScreen('/:owner/:name/stargazers', (_, p) {
    return GhUsersScreen(p['owner'].first, UsersScreenType.star,
        repoName: p['name'].first);
  });
  static final watchers = RouterScreen('/:owner/:name/watchers', (_, p) {
    return GhUsersScreen(p['owner'].first, UsersScreenType.watch,
        repoName: p['name'].first);
  });
  static final contributors = RouterScreen('/:owner/:name/contributors', (_, p) {
    return GhContributorsScreen(p['owner'].first, p['name'].first);
  });
}

class GitlabRouter {
  static const prefix = '/gitlab';
  static final routes = [
    GitlabRouter.user,
    GitlabRouter.group,
    GitlabRouter.blob,
    GitlabRouter.tree,
    GitlabRouter.project,
    GitlabRouter.starrers,
    GitlabRouter.issues,
    GitlabRouter.mergeRequests,
    GitlabRouter.commits,
    GitlabRouter.commit,
    GitlabRouter.projectMembers,
    GitlabRouter.groupMembers,
    GitlabRouter.issue,
  ];
  static final user = RouterScreen(
      '/user/:id', (context, p) => GlUserScreen(int.parse(p['id'].first)));
  static final group = RouterScreen(
      '/group/:id', (context, p) => GlGroupScreen(int.parse(p['id'].first)));
  static final blob = RouterScreen(
      '/projects/:id/blob/:ref',
      (context, params) => GlBlobScreen(
          int.parse(params['id'].first), params['ref'].first,
          path: params['path']?.first));
  static final tree = RouterScreen(
      '/projects/:id/tree/:ref',
      (context, params) => GlTreeScreen(
          int.parse(params['id'].first), params['ref'].first,
          path: params['path']?.first));
  static final project = RouterScreen('/projects/:id',
      (context, params) => GlProjectScreen(int.parse(params['id'].first)));
  static final starrers = RouterScreen('/projects/:id/starrers',
      (context, params) => GlStarrersScreen(int.parse(params['id'].first)));
  static final issues = RouterScreen(
      '/projects/:id/issues',
      (context, params) => GlIssuesScreen(
            params['id'].first,
            prefix: params['prefix'].first,
          ));
  static final mergeRequests = RouterScreen(
      '/projects/:id/merge_requests',
      (context, params) => GlMergeRequestsScreen(
            params['id'].first,
            prefix: params['prefix'].first,
          ));
  static final commits = RouterScreen(
      '/projects/:id/commits',
      (context, params) =>
          GlCommitsScreen(params['id'].first, prefix: params['prefix'].first));
  static final commit = RouterScreen(
      '/projects/:id/commit/:sha',
      (context, params) =>
          GlCommitScreen(params['id'].first, sha: params['sha'].first));
  static final projectMembers = RouterScreen(
      '/projects/:id/members',
      (context, parameters) =>
          GlMembersScreen(int.parse(parameters['id'].first), 'projects'));
  static final groupMembers = RouterScreen(
      '/groups/:id/members',
      (context, parameters) =>
          GlMembersScreen(int.parse(parameters['id'].first), 'groups'));
  static final issue = RouterScreen(
    '/gitlab/projects/:id/issues/:iid',
    (context, params) {
      return GlIssueScreen(
        int.parse(params['id'].first),
        int.parse(params['iid'].first),
      );
    },
  );
}

class GiteaRouter {
  static const prefix = '/gitea';
  static final routes = [
    GiteaRouter.user,
    GiteaRouter.repo,
    GiteaRouter.object,
    GiteaRouter.commits,
    GiteaRouter.issues,
    GiteaRouter.pulls,
  ];
  static final user = RouterScreen(
    '/:login',
    (context, params) => params['org'].first == '1'
        ? GtOrgScreen(params['login'].first)
        : GtUserScreen(params['login'].first),
  );
  static final repo = RouterScreen(
    '/:owner/:name',
    (context, params) =>
        GtRepoScreen(params['owner'].first, params['name'].first),
  );
  static final object = RouterScreen(
    '/:owner/:name/blob',
    (context, params) => GtObjectScreen(
      params['owner'].first,
      params['name'].first,
      path: params['path']?.first,
    ),
  );
  static final commits = RouterScreen('/:owner/:name/commits',
      (_, p) => GtCommitsScreen(p['owner'].first, p['name'].first));
  static final issues = RouterScreen('/:owner/:name/issues',
      (_, p) => GtIssuesScreen(p['owner'].first, p['name'].first));
  static final pulls = RouterScreen('/:owner/:name/pulls',
      (_, p) => GtIssuesScreen(p['owner'].first, p['name'].first, isPr: true));
}

class BitbucketRouter {
  static const prefix = '/bitbucket';
  static final routes = [
    BitbucketRouter.user,
    BitbucketRouter.repo,
    BitbucketRouter.object,
    BitbucketRouter.commits,
  ];
  static final user = RouterScreen(
      '/:login',
      (context, params) => BbUserScreen(params['login'].first,
          isTeam: params['team'].first == '1'));
  static final repo = RouterScreen(
    '/:owner/:name',
    (context, params) =>
        BbRepoScreen(params['owner'].first, params['name'].first),
  );
  static final object = RouterScreen(
    '/:owner/:name/src/:ref',
    (context, params) => BbObjectScreen(
      params['owner'].first,
      params['name'].first,
      params['ref'].first,
      path: params['path']?.first,
    ),
  );
  static final commits = RouterScreen(
      '/:owner/:name/commits/:ref',
      (_, p) =>
          BbCommitsScreen(p['owner'].first, p['name'].first, p['ref'].first));
}
