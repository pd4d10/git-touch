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
import 'package:git_touch/screens/ge_contributors.dart';
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
import 'package:git_touch/screens/gl_issue_form.dart';
import 'package:git_touch/screens/gl_starrers.dart';
import 'package:git_touch/screens/gt_commits.dart';
import 'package:git_touch/screens/gt_issue.dart';
import 'package:git_touch/screens/gt_issue_comment.dart';
import 'package:git_touch/screens/gt_issue_form.dart';
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
  static final codeTheme =
      RouterScreen('/choose-code-theme', (context, parameters) {
    return CodeThemeScreen();
  });
  static final login =
      RouterScreen('/login', (context, parameters) => LoginScreen());
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
  static final user = RouterScreen('/:login', (context, parameters) {
    final login = parameters['login'].first;
    final tab = parameters['tab']?.first;
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
  static final repo = RouterScreen('/:owner/:name', (context, parameters) {
    if (parameters['ref'] == null) {
      return GhRepoScreen(parameters['owner'].first, parameters['name'].first);
    } else {
      return GhRepoScreen(parameters['owner'].first, parameters['name'].first,
          branch: parameters['ref'].first);
    }
  });
  static final gistObject =
      RouterScreen('/:login/gists/:id/:file', (context, parameters) {
    return GistObjectScreen(
      parameters['login'].first,
      parameters['id'].first,
      parameters['file'].first,
      raw: parameters['raw']?.first,
      content: parameters['content'].first,
    );
  });
  static final gistFiles =
      RouterScreen('/:login/gists/:id', (context, parameters) {
    return GhGistsFilesScreen(
        parameters['login'].first, parameters['id'].first);
  });
  static final issueAdd =
      RouterScreen('/:owner/:name/issues/new', (context, parameters) {
    return GhIssueFormScreen(
        parameters['owner'].first, parameters['name'].first);
  });
  static final issues = RouterScreen(
      '/:owner/:name/issues',
      (context, parameters) =>
          GhIssuesScreen(parameters['owner'].first, parameters['name'].first));
  static final pulls = RouterScreen(
      '/:owner/:name/pulls',
      (context, parameters) =>
          GhPullsScreen(parameters['owner'].first, parameters['name'].first));
  static final issue = RouterScreen(
      '/:owner/:name/issues/:number',
      (context, parameters) => GhIssueScreen(parameters['owner'].first,
          parameters['name'].first, int.parse(parameters['number'].first)));
  static final pull = RouterScreen(
      '/:owner/:name/pull/:number',
      (context, parameters) => GhIssueScreen(parameters['owner'].first,
          parameters['name'].first, int.parse(parameters['number'].first),
          isPullRequest: true));
  static final files = RouterScreen(
      '/:owner/:name/pull/:number/files',
      (context, parameters) => GhFilesScreen(
            parameters['owner'].first,
            parameters['name'].first,
            int.parse(parameters['number'].first),
          ));
  static final compare = RouterScreen(
      '/:owner/:name/compare/:before/:head',
      (context, parameters) => GhComparisonScreen(
          parameters['owner'].first,
          parameters['name'].first,
          parameters['before'].first,
          parameters['head'].first));
  static final commits = RouterScreen(
      '/:owner/:name/commits',
      (context, parameters) =>
          GhCommitsScreen(parameters['owner'].first, parameters['name'].first));
  static final object =
      RouterScreen('/:owner/:name/blob/:ref', (context, parameters) {
    return GhObjectScreen(
      parameters['owner'].first,
      parameters['name'].first,
      parameters['ref'].first,
      path: parameters['path']?.first,
      raw: parameters['raw']?.first,
    );
  });
  static final stargazers =
      RouterScreen('/:owner/:name/stargazers', (context, parameters) {
    return GhUsersScreen(parameters['owner'].first, UsersScreenType.star,
        repoName: parameters['name'].first);
  });
  static final watchers =
      RouterScreen('/:owner/:name/watchers', (context, parameters) {
    return GhUsersScreen(parameters['owner'].first, UsersScreenType.watch,
        repoName: parameters['name'].first);
  });
  static final contributors =
      RouterScreen('/:owner/:name/contributors', (context, parameters) {
    return GhContributorsScreen(
        parameters['owner'].first, parameters['name'].first);
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
    GitlabRouter.issueAdd,
    GitlabRouter.issue,
  ];
  static final user = RouterScreen('/user/:id',
      (context, parameters) => GlUserScreen(int.parse(parameters['id'].first)));
  static final group = RouterScreen(
      '/group/:id',
      (context, parameters) =>
          GlGroupScreen(int.parse(parameters['id'].first)));
  static final blob = RouterScreen(
      '/projects/:id/blob/:ref',
      (context, parameters) => GlBlobScreen(
          int.parse(parameters['id'].first), parameters['ref'].first,
          path: parameters['path']?.first));
  static final tree = RouterScreen(
      '/projects/:id/tree/:ref',
      (context, parameters) => GlTreeScreen(
          int.parse(parameters['id'].first), parameters['ref'].first,
          path: parameters['path']?.first));
  static final project = RouterScreen('/projects/:id', (context, parameters) {
    if (parameters['branch'] == null) {
      return GlProjectScreen(int.parse(parameters['id'].first));
    } else {
      return GlProjectScreen(int.parse(parameters['id'].first),
          branch: parameters['branch'].first);
    }
  });
  static final starrers = RouterScreen(
      '/projects/:id/starrers',
      (context, parameters) =>
          GlStarrersScreen(int.parse(parameters['id'].first)));
  static final issues = RouterScreen(
      '/projects/:id/issues',
      (context, parameters) => GlIssuesScreen(
            parameters['id'].first,
            prefix: parameters['prefix'].first,
          ));
  static final mergeRequests = RouterScreen(
      '/projects/:id/merge_requests',
      (context, parameters) => GlMergeRequestsScreen(
            parameters['id'].first,
            prefix: parameters['prefix'].first,
          ));
  static final commits =
      RouterScreen('/projects/:id/commits', (context, parameters) {
    if (parameters['branch'] == null) {
      return GlCommitsScreen(parameters['id'].first,
          prefix: parameters['prefix'].first);
    } else {
      return GlCommitsScreen(parameters['id'].first,
          prefix: parameters['prefix'].first,
          branch: parameters['branch'].first);
    }
  });
  static final commit = RouterScreen(
      '/projects/:id/commit/:sha',
      (context, parameters) =>
          GlCommitScreen(parameters['id'].first, sha: parameters['sha'].first));
  static final projectMembers = RouterScreen(
      '/projects/:id/members',
      (context, parameters) =>
          GlMembersScreen(int.parse(parameters['id'].first), 'projects'));
  static final groupMembers = RouterScreen(
      '/groups/:id/members',
      (context, parameters) =>
          GlMembersScreen(int.parse(parameters['id'].first), 'groups'));
  static final issue = RouterScreen(
    '/projects/:id/issues/:iid',
    (context, parameters) {
      return GlIssueScreen(
        int.parse(parameters['id'].first),
        int.parse(parameters['iid'].first),
      );
    },
  );
  static final issueAdd =
      RouterScreen('/projects/:id/issues/new', (context, parameters) {
    return GlIssueFormScreen(int.parse(parameters['id'].first));
  });
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
    GiteaRouter.issueAdd,
    GiteaRouter.issue,
    GiteaRouter.issueComment,
  ];
  static final status =
      RouterScreen('/status', (context, parameters) => GtStatusScreen());
  static final user = RouterScreen('/:login', (context, parameters) {
    final login = parameters['login'].first;
    final tab = parameters['tab']?.first;
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
    (context, parameters) =>
        GtRepoScreen(parameters['owner'].first, parameters['name'].first),
  );
  static final object = RouterScreen(
    '/:owner/:name/blob',
    (context, parameters) => GtObjectScreen(
      parameters['owner'].first,
      parameters['name'].first,
      path: parameters['path']?.first,
    ),
  );
  static final stargazers =
      RouterScreen('/:owner/:name/stargazers', (context, parameters) {
    return GtUsersScreen.stargazers(
        parameters['owner'].first, parameters['name'].first);
  });
  static final watchers =
      RouterScreen('/:owner/:name/watchers', (context, parameters) {
    return GtUsersScreen.watchers(
        parameters['owner'].first, parameters['name'].first);
  });
  static final forks =
      RouterScreen('/:owner/:name/forks', (context, parameters) {
    return GtReposScreen.forks(
        parameters['owner'].first, parameters['name'].first);
  });
  static final commits = RouterScreen(
      '/:owner/:name/commits',
      (context, parameters) =>
          GtCommitsScreen(parameters['owner'].first, parameters['name'].first));
  static final issues = RouterScreen(
      '/:owner/:name/issues',
      (context, parameters) =>
          GtIssuesScreen(parameters['owner'].first, parameters['name'].first));
  static final pulls = RouterScreen(
      '/:owner/:name/pulls',
      (context, parameters) => GtIssuesScreen(
          parameters['owner'].first, parameters['name'].first,
          isPr: true));
  static final issueAdd = RouterScreen(
      '/:owner/:name/issues/new',
      (context, parameters) => GtIssueFormScreen(
          parameters['owner'].first, parameters['name'].first));
  static final issue = RouterScreen(
      '/:owner/:name/issues/:number',
      (context, parameters) => GtIssueScreen(parameters['owner'].first,
          parameters['name'].first, parameters['number'].first));
  static final issueComment = RouterScreen(
      '/:owner/:name/issues/:number/comment',
      (context, parameters) => GtIssueCommentScreen(parameters['owner'].first,
          parameters['name'].first, parameters['number'].first,
          body: parameters['body'] != null ? parameters['body'].first : '',
          id: parameters['id'] != null ? parameters['id'].first : ''));
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
      (context, parameters) => BbUserScreen(parameters['login'].first,
          isTeam: parameters['team'].first == '1'));
  static final repo = RouterScreen('/:owner/:name', (context, parameters) {
    if (parameters['branch'] == null) {
      return BbRepoScreen(parameters['owner'].first, parameters['name'].first);
    } else {
      return BbRepoScreen(parameters['owner'].first, parameters['name'].first,
          branch: parameters['branch'].first);
    }
  });
  static final object = RouterScreen(
    '/:owner/:name/src/:ref',
    (context, parameters) => BbObjectScreen(
      parameters['owner'].first,
      parameters['name'].first,
      parameters['ref'].first,
      path: parameters['path']?.first,
    ),
  );
  static final issues = RouterScreen(
      '/:owner/:name/issues',
      (context, parameters) =>
          BbIssuesScreen(parameters['owner'].first, parameters['name'].first));
  static final commits = RouterScreen(
      '/:owner/:name/commits/:ref',
      (context, parameters) => BbCommitsScreen(parameters['owner'].first,
          parameters['name'].first, parameters['ref'].first));
  static final pulls = RouterScreen(
      '/:owner/:name/pulls',
      (context, parameters) =>
          BbPullsScreen(parameters['owner'].first, parameters['name'].first));
  static final issueAdd = RouterScreen(
      '/:owner/:name/issues/new',
      (context, parameters) => BbIssueFormScreen(
          parameters['owner'].first, parameters['name'].first));
  static final issue = RouterScreen(
      '/:owner/:name/issues/:number',
      (context, parameters) => BbIssueScreen(parameters['owner'].first,
          parameters['name'].first, parameters['number'].first));
  static final issueComment = RouterScreen(
      '/:owner/:name/issues/:number/comment',
      (context, parameters) => BbIssueCommentScreen(parameters['owner'].first,
          parameters['name'].first, parameters['number'].first));
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
    GiteeRouter.contributors,
  ];
  static final search = RouterScreen('/search', (context, parameters) {
    return GeSearchScreen();
  });
  static final user = RouterScreen('/:login', (context, parameters) {
    final login = parameters['login'].first;
    final tab = parameters['tab']?.first;
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
    (context, parameters) {
      if (parameters['branch'] == null) {
        return GeRepoScreen(
            parameters['owner'].first, parameters['name'].first);
      } else {
        return GeRepoScreen(parameters['owner'].first, parameters['name'].first,
            branch: parameters['branch'].first);
      }
    },
  );
  static final stargazers =
      RouterScreen('/:owner/:name/stargazers', (context, parameters) {
    return GeUsersScreen.stargazers(
        parameters['owner'].first, parameters['name'].first);
  });
  static final watchers =
      RouterScreen('/:owner/:name/watchers', (context, parameters) {
    return GeUsersScreen.watchers(
        parameters['owner'].first, parameters['name'].first);
  });
  static final forks =
      RouterScreen('/:owner/:name/forks', (context, parameters) {
    return GeReposScreen.forks(
        parameters['owner'].first, parameters['name'].first);
  });
  static final commits = RouterScreen(
    '/:owner/:name/commits',
    (context, parameters) => GeCommitsScreen(
        parameters['owner'].first, parameters['name'].first,
        branch:
            parameters['branch'] != null ? parameters['branch'].first : null),
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
  static final contributors = RouterScreen(
    '/:owner/:name/contributors',
    (context, parameters) => GeContributorsScreen(
        parameters['owner'].first, parameters['name'].first),
  );
}
