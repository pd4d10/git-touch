import 'package:fluro/fluro.dart';
import 'package:git_touch/screens/code_theme.dart';
import 'package:git_touch/screens/commits.dart';
import 'package:git_touch/screens/gitea_object.dart';
import 'package:git_touch/screens/gitea_repo.dart';
import 'package:git_touch/screens/gitea_user.dart';
import 'package:git_touch/screens/gitlab_blob.dart';
import 'package:git_touch/screens/gitlab_commits.dart';
import 'package:git_touch/screens/gitlab_group.dart';
import 'package:git_touch/screens/gitlab_issue.dart';
import 'package:git_touch/screens/gitlab_issues.dart';
import 'package:git_touch/screens/gitlab_members.dart';
import 'package:git_touch/screens/gitlab_merge_requests.dart';
import 'package:git_touch/screens/gitlab_project.dart';
import 'package:git_touch/screens/gitlab_tree.dart';
import 'package:git_touch/screens/gitlab_user.dart';
import 'package:git_touch/screens/issue.dart';
import 'package:git_touch/screens/issue_form.dart';
import 'package:git_touch/screens/issues.dart';
import 'package:git_touch/screens/login.dart';
import 'package:git_touch/screens/object.dart';
import 'package:git_touch/screens/pulls.dart';
import 'package:git_touch/screens/repositories.dart';
import 'package:git_touch/screens/repository.dart';
import 'package:git_touch/screens/settings.dart';
import 'package:git_touch/screens/user.dart';
import 'package:git_touch/screens/users.dart';

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
  ];
  static final user = RouterScreen('/:login', (_, p) {
    final login = p['login'].first;
    final tab = p['tab']?.first;
    switch (tab) {
      case 'followers':
        return UsersScreen(login, UsersScreenType.follower);
      case 'following':
        return UsersScreen(login, UsersScreenType.following);
      case 'people':
        return UsersScreen(login, UsersScreenType.member);
      case 'stars':
        return RepositoriesScreen.stars(login);
      case 'repositories':
        return RepositoriesScreen(login);
      default:
        return UserScreen(login);
    }
  });
  static final repo = RouterScreen('/:owner/:name', (_, p) {
    if (p['ref'] == null) {
      return RepositoryScreen(p['owner'].first, p['name'].first);
    } else {
      return RepositoryScreen(p['owner'].first, p['name'].first,
          branch: p['ref'].first);
    }
  });
  static final issueAdd = RouterScreen('/:owner/:name/issues/new', (_, p) {
    return IssueFormScreen(p['owner'].first, p['name'].first);
  });
  static final issues = RouterScreen('/:owner/:name/issues',
      (context, p) => IssuesScreen(p['owner'].first, p['name'].first));
  static final pulls = RouterScreen('/:owner/:name/pulls',
      (context, p) => PullsScreen(p['owner'].first, p['name'].first));
  static final issue = RouterScreen(
      '/:owner/:name/issues/:number',
      (context, p) => IssueScreen(
          p['owner'].first, p['name'].first, int.parse(p['number'].first)));
  static final pull = RouterScreen(
      '/:owner/:name/pull/:number',
      (context, p) => IssueScreen(
          p['owner'].first, p['name'].first, int.parse(p['number'].first),
          isPullRequest: true));
  static final commits = RouterScreen('/:owner/:name/commits',
      (context, p) => CommitsScreen(p['owner'].first, p['name'].first));
  static final object = RouterScreen('/:owner/:name/blob/:ref', (_, p) {
    return ObjectScreen(
      p['owner'].first,
      p['name'].first,
      p['ref'].first,
      path: p['path']?.first,
      raw: p['raw']?.first,
    );
  });
  static final stargazers = RouterScreen('/:owner/:name/stargazers', (_, p) {
    return UsersScreen(p['owner'].first, UsersScreenType.star,
        repoName: p['name'].first);
  });
  static final watchers = RouterScreen('/:owner/:name/watchers', (_, p) {
    return UsersScreen(p['owner'].first, UsersScreenType.watch,
        repoName: p['name'].first);
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
    GitlabRouter.issues,
    GitlabRouter.mergeRequests,
    GitlabRouter.commits,
    GitlabRouter.projectMembers,
    GitlabRouter.groupMembers,
    GitlabRouter.issue,
  ];
  static final user = RouterScreen(
      '/user/:id', (context, p) => GitlabUserScreen(int.parse(p['id'].first)));
  static final group = RouterScreen('/group/:id',
      (context, p) => GitlabGroupScreen(int.parse(p['id'].first)));
  static final blob = RouterScreen(
      '/projects/:id/blob',
      (context, params) => GitlabBlobScreen(int.parse(params['id'].first),
          path: params['path']?.first));
  static final tree = RouterScreen(
      '/projects/:id/tree',
      (context, params) => GitlabTreeScreen(int.parse(params['id'].first),
          path: params['path']?.first));
  static final project = RouterScreen('/projects/:id',
      (context, params) => GitlabProjectScreen(int.parse(params['id'].first)));
  static final issues = RouterScreen(
      '/projects/:id/issues',
      (context, params) => GitlabIssuesScreen(
            params['id'].first,
            prefix: params['prefix'].first,
          ));
  static final mergeRequests = RouterScreen(
      '/projects/:id/merge_requests',
      (context, params) => GitlabMergeRequestsScreen(
            params['id'].first,
            prefix: params['prefix'].first,
          ));
  static final commits = RouterScreen('/projects/:id/commits',
      (context, params) => GitlabCommitsScreen(params['id'].first));
  static final projectMembers = RouterScreen(
      '/projects/:id/members',
      (context, parameters) =>
          GitlabMembers(int.parse(parameters['id'].first), 'projects'));
  static final groupMembers = RouterScreen(
      '/groups/:id/members',
      (context, parameters) =>
          GitlabMembers(int.parse(parameters['id'].first), 'groups'));
  static final issue = RouterScreen(
    '/gitlab/projects/:id/issues/:iid',
    (context, params) {
      return GitlabIssueScreen(
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
    GiteaRouter.object
  ];
  static final user = RouterScreen(
    '/:login',
    (context, params) => GiteaUserScreen(params['login'].first),
  );
  static final repo = RouterScreen(
    '/:owner/:name',
    (context, params) =>
        GiteaRepoScreen(params['owner'].first, params['name'].first),
  );
  static final object = RouterScreen(
    '/gitea/:owner/:name/blob',
    (context, params) => GiteaObjectScreen(
      params['owner'].first,
      params['name'].first,
      path: params['path']?.first,
    ),
  );
}
