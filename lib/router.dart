import 'package:fluro/fluro.dart';
import 'package:git_touch/screens/bb_commits.dart';
import 'package:git_touch/screens/bb_issue.dart';
import 'package:git_touch/screens/bb_issue_comment.dart';
import 'package:git_touch/screens/bb_issue_form.dart';
import 'package:git_touch/screens/bb_object.dart';
import 'package:git_touch/screens/bb_repo.dart';
import 'package:git_touch/screens/bb_issues.dart';
import 'package:git_touch/screens/bb_pulls.dart';
import 'package:git_touch/screens/bb_user.dart';
import 'package:git_touch/screens/code_theme.dart';
import 'package:git_touch/screens/ge_blob.dart';
import 'package:git_touch/screens/ge_commit.dart';
import 'package:git_touch/screens/ge_commits.dart';
import 'package:git_touch/screens/ge_files.dart';
import 'package:git_touch/screens/ge_issue.dart';
import 'package:git_touch/screens/ge_issue_comment.dart';
import 'package:git_touch/screens/ge_issue_form.dart';
import 'package:git_touch/screens/ge_issues.dart';
import 'package:git_touch/screens/ge_pull.dart';
import 'package:git_touch/screens/ge_pulls.dart';
import 'package:git_touch/screens/ge_repo.dart';
import 'package:git_touch/screens/ge_repos.dart';
import 'package:git_touch/screens/ge_search.dart';
import 'package:git_touch/screens/ge_tree.dart';
import 'package:git_touch/screens/ge_user.dart';
import 'package:git_touch/screens/ge_users.dart';
import 'package:git_touch/screens/gh_commits.dart';
import 'package:git_touch/screens/gh_contributors.dart';
import 'package:git_touch/screens/gh_events.dart';
import 'package:git_touch/screens/gh_files.dart';
import 'package:git_touch/screens/gh_gists_files.dart';
import 'package:git_touch/screens/gh_org_repos.dart';
import 'package:git_touch/screens/gl_commit.dart';
import 'package:git_touch/screens/gl_starrers.dart';
import 'package:git_touch/screens/gt_commits.dart';
import 'package:git_touch/screens/gt_issues.dart';
import 'package:git_touch/screens/gt_object.dart';
import 'package:git_touch/screens/gt_orgs.dart';
import 'package:git_touch/screens/gt_repo.dart';
import 'package:git_touch/screens/gt_repos.dart';
import 'package:git_touch/screens/gt_status.dart';
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
import 'package:git_touch/screens/gt_users.dart';
import 'package:git_touch/screens/login.dart';
import 'package:git_touch/screens/gh_object.dart';
import 'package:git_touch/screens/gh_pulls.dart';
import 'package:git_touch/screens/gh_repos.dart';
import 'package:git_touch/screens/gh_repo.dart';
import 'package:git_touch/screens/settings.dart';
import 'package:git_touch/screens/gh_user.dart';
import 'package:git_touch/screens/gh_users.dart';
import 'package:git_touch/screens/gh_orgs.dart';
import 'package:git_touch/screens/gh_gists.dart';
import 'package:git_touch/screens/gh_gist_object.dart';
import 'package:git_touch/screens/gh_compare.dart';

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
  static const prefix = '/github';
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
    GithubRouter.files,
    GithubRouter.gistFiles,
    GithubRouter.gistObject,
    GithubRouter.compare,
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
      case 'organizations':
        return GhUserOrganizationScreen(login);
      case 'gists':
        return GhGistsScreen(login);
      case 'events':
        return GhEventsScreen(login);
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
  static final gistObject = RouterScreen('/:login/gists/:id/:file', (_, p) {
    return GistObjectScreen(
      p['login'].first,
      p['id'].first,
      p['file'].first,
      raw: p['raw']?.first,
      content: p['content'].first,
    );
  });
  static final gistFiles = RouterScreen('/:login/gists/:id', (_, p) {
    return GhGistsFilesScreen(p['login'].first, p['id'].first);
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
  static final files = RouterScreen(
      '/:owner/:name/pull/:number/files',
      (context, p) => GhFilesScreen(
            p['owner'].first,
            p['name'].first,
            int.parse(p['number'].first),
          ));
  static final compare = RouterScreen(
      '/:owner/:name/compare/:before/:head',
      (context, p) => GhComparisonScreen(p['owner'].first, p['name'].first,
          p['before'].first, p['head'].first));
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
  static final contributors =
      RouterScreen('/:owner/:name/contributors', (_, p) {
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
    GiteaRouter.status,
    GiteaRouter.user,
    GiteaRouter.repo,
    GiteaRouter.object,
    GiteaRouter.stargazers,
    GiteaRouter.watchers,
    GiteaRouter.forks,
    GiteaRouter.commits,
    GiteaRouter.issues,
    GiteaRouter.pulls,
  ];
  static final status =
      RouterScreen('/status', (context, parameters) => GtStatusScreen());
  static final user = RouterScreen('/:login', (context, p) {
    final login = p['login'].first;
    final tab = p['tab']?.first;
    switch (tab) {
      case 'followers':
        return GtUsersScreen.followers(login);
      case 'following':
        return GtUsersScreen.following(login);
      case 'people':
        return GtUsersScreen.member(login);
      case 'stars':
        return GtReposScreen.star(login);
      case 'repositories':
        return GtReposScreen(login);
      case 'orgrepo':
        return GtReposScreen.org(login);
      case 'organizations':
        return GtOrgsScreen.ofUser(login);
      default:
        return GtUserScreen(login);
    }
  });
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
  static final stargazers = RouterScreen('/:owner/:name/stargazers', (_, p) {
    return GtUsersScreen.stargazers(p['owner'].first, p['name'].first);
  });
  static final watchers = RouterScreen('/:owner/:name/watchers', (_, p) {
    return GtUsersScreen.watchers(p['owner'].first, p['name'].first);
  });
  static final forks = RouterScreen('/:owner/:name/forks', (_, p) {
    return GtReposScreen.forks(p['owner'].first, p['name'].first);
  });
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
    BitbucketRouter.issueAdd,
    BitbucketRouter.issueComment,
    BitbucketRouter.issue,
    BitbucketRouter.issues,
    BitbucketRouter.pulls,
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
  static final issues = RouterScreen('/:owner/:name/issues',
      (_, p) => BbIssuesScreen(p['owner'].first, p['name'].first));
  static final commits = RouterScreen(
      '/:owner/:name/commits/:ref',
      (_, p) =>
          BbCommitsScreen(p['owner'].first, p['name'].first, p['ref'].first));
  static final pulls = RouterScreen('/:owner/:name/pulls',
      (_, p) => BbPullsScreen(p['owner'].first, p['name'].first));
  static final issueAdd = RouterScreen('/:owner/:name/issues/new',
      (_, p) => BbIssueFormScreen(p['owner'].first, p['name'].first));
  static final issue = RouterScreen(
      '/:owner/:name/issues/:number',
      (_, p) =>
          BbIssueScreen(p['owner'].first, p['name'].first, p['number'].first));
  static final issueComment = RouterScreen(
      '/:owner/:name/issues/:number/comment',
      (_, p) => BbIssueCommentScreen(
          p['owner'].first, p['name'].first, p['number'].first));
}

class GiteeRouter {
  static const prefix = '/gitee';
  static final routes = [
    GiteeRouter.search,
    GiteeRouter.user,
    GiteeRouter.repo,
    GiteeRouter.stargazers,
    GiteeRouter.watchers,
    GiteeRouter.forks,
    GiteeRouter.commits,
    GiteeRouter.tree,
    GiteeRouter.blob,
    GiteeRouter.issues,
    GiteeRouter.pulls,
    GiteeRouter.issueAdd, // issueAdd should be above issue
    GiteeRouter.issue, // Due to similarity of uris
    GiteeRouter.issueComment,
    GiteeRouter.pull,
    GiteeRouter.pullComment,
    GiteeRouter.files,
    GiteeRouter.commit,
  ];
  static final search = RouterScreen('/search', (context, parameters) {
    return GeSearchScreen();
  });
  static final user = RouterScreen('/:login', (context, p) {
    final login = p['login'].first;
    final tab = p['tab']?.first;
    switch (tab) {
      case 'followers':
        return GeUsersScreen.followers(login);
      case 'following':
        return GeUsersScreen.following(login);
      // case 'people':
      case 'stars':
        return GeReposScreen.star(login);
      case 'repositories':
        return GeReposScreen(login);
      default:
        return GeUserScreen(login);
    }
  });
  static final repo = RouterScreen(
    '/:owner/:name',
    (context, params) =>
        GeRepoScreen(params['owner'].first, params['name'].first),
  );
  static final stargazers = RouterScreen('/:owner/:name/stargazers', (_, p) {
    return GeUsersScreen.stargazers(p['owner'].first, p['name'].first);
  });
  static final watchers = RouterScreen('/:owner/:name/watchers', (_, p) {
    return GeUsersScreen.watchers(p['owner'].first, p['name'].first);
  });
  static final forks = RouterScreen('/:owner/:name/forks', (_, p) {
    return GeReposScreen.forks(p['owner'].first, p['name'].first);
  });
  static final commits = RouterScreen(
    '/:owner/:name/commits',
    (_, p) => GeCommitsScreen(p['owner'].first, p['name'].first),
  );
  static final tree = RouterScreen(
    '/:owner/:name/tree/:sha',
    (context, parameters) {
      return GeTreeScreen(parameters['owner'].first, parameters['name'].first,
          parameters['sha'].first);
    },
  );
  static final blob = RouterScreen(
    '/:owner/:name/blob/:sha',
    (context, parameters) {
      return GeBlobScreen(
        parameters['owner'].first,
        parameters['name'].first,
        parameters['sha'].first,
        parameters['path'].first,
      );
    },
  );
  static final issues = RouterScreen(
    '/:owner/:name/issues',
    (context, parameters) {
      return GeIssuesScreen(parameters['owner'].first, parameters['name'].first,
          isPr: false);
    },
  );
  static final issue =
      RouterScreen('/:owner/:name/issues/:number', (context, parameters) {
    return GeIssueScreen(parameters['owner'].first, parameters['name'].first,
        parameters['number'].first,
        isPr: false);
  });
  static final pulls = RouterScreen(
    '/:owner/:name/pulls',
    (context, parameters) {
      return GePullsScreen(parameters['owner'].first, parameters['name'].first,
          isPr: true);
    },
  );
  static final issueAdd =
      RouterScreen('/:owner/:name/issues/new', (context, parameters) {
    return GeIssueFormScreen(
        parameters['owner'].first, parameters['name'].first);
  });
  static final issueComment = RouterScreen(
      '/:owner/:name/issues/:number/comment', (context, parameters) {
    return GeIssueCommentScreen(
      parameters['owner'].first,
      parameters['name'].first,
      parameters['number'].first,
      isPr: false,
      body: parameters['body'] != null ? parameters['body'].first : '',
      id: parameters['id'] != null ? parameters['id'].first : '',
    );
  });
  static final pull = RouterScreen(
    '/:owner/:name/pulls/:number',
    (context, parameters) {
      return GePullScreen(parameters['owner'].first, parameters['name'].first,
          parameters['number'].first,
          isPr: true);
    },
  );
  static final pullComment = RouterScreen('/:owner/:name/pulls/:number/comment',
      (context, parameters) {
    return GeIssueCommentScreen(
      parameters['owner'].first,
      parameters['name'].first,
      parameters['number'].first,
      isPr: true,
      body: parameters['body'] != null ? parameters['body'].first : '',
      id: parameters['id'] != null ? parameters['id'].first : '',
    );
  });
  static final files =
      RouterScreen('/:owner/:name/pulls/:number/files', (context, parameters) {
    return GeFilesScreen(parameters['owner'].first, parameters['name'].first,
        parameters['number'].first);
  });
  static final commit = RouterScreen(
    '/:owner/:name/commits/:sha',
    (context, parameters) => GeCommitScreen(parameters['owner'].first,
        parameters['name'].first, parameters['sha'].first),
  );
}
