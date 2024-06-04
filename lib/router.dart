import 'package:git_touch/home.dart';
import 'package:git_touch/screens/bb_commits.dart';
import 'package:git_touch/screens/bb_issue.dart';
import 'package:git_touch/screens/bb_issue_comment.dart';
import 'package:git_touch/screens/bb_issue_form.dart';
import 'package:git_touch/screens/bb_issues.dart';
import 'package:git_touch/screens/bb_object.dart';
import 'package:git_touch/screens/bb_pulls.dart';
import 'package:git_touch/screens/bb_repo.dart';
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
import 'package:git_touch/screens/ge_pulls.dart';
import 'package:git_touch/screens/ge_repo.dart';
import 'package:git_touch/screens/ge_repos.dart';
import 'package:git_touch/screens/ge_search.dart';
import 'package:git_touch/screens/ge_tree.dart';
import 'package:git_touch/screens/ge_user.dart';
import 'package:git_touch/screens/ge_users.dart';
import 'package:git_touch/screens/gh_commit.dart';
import 'package:git_touch/screens/gh_commits.dart';
import 'package:git_touch/screens/gh_compare.dart';
import 'package:git_touch/screens/gh_contributors.dart';
import 'package:git_touch/screens/gh_events.dart';
import 'package:git_touch/screens/gh_files.dart';
import 'package:git_touch/screens/gh_gist_object.dart';
import 'package:git_touch/screens/gh_gists.dart';
import 'package:git_touch/screens/gh_gists_files.dart';
import 'package:git_touch/screens/gh_issue.dart';
import 'package:git_touch/screens/gh_issue_form.dart';
import 'package:git_touch/screens/gh_issues.dart';
import 'package:git_touch/screens/gh_meta.dart';
import 'package:git_touch/screens/gh_object.dart';
import 'package:git_touch/screens/gh_pulls.dart';
import 'package:git_touch/screens/gh_releases.dart';
import 'package:git_touch/screens/gh_repo.dart';
import 'package:git_touch/screens/gh_repos.dart';
import 'package:git_touch/screens/gh_user.dart';
import 'package:git_touch/screens/gh_users.dart';
import 'package:git_touch/screens/gl_blob.dart';
import 'package:git_touch/screens/gl_commit.dart';
import 'package:git_touch/screens/gl_commits.dart';
import 'package:git_touch/screens/gl_group.dart';
import 'package:git_touch/screens/gl_issue.dart';
import 'package:git_touch/screens/gl_issue_form.dart';
import 'package:git_touch/screens/gl_issues.dart';
import 'package:git_touch/screens/gl_members.dart';
import 'package:git_touch/screens/gl_merge_requests.dart';
import 'package:git_touch/screens/gl_project.dart';
import 'package:git_touch/screens/gl_starrers.dart';
import 'package:git_touch/screens/gl_tree.dart';
import 'package:git_touch/screens/gl_user.dart';
import 'package:git_touch/screens/go_commits.dart';
import 'package:git_touch/screens/go_issues.dart';
import 'package:git_touch/screens/go_object.dart';
import 'package:git_touch/screens/go_orgs.dart';
import 'package:git_touch/screens/go_repo.dart';
import 'package:git_touch/screens/go_repos.dart';
import 'package:git_touch/screens/go_user.dart';
import 'package:git_touch/screens/go_users.dart';
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
import 'package:git_touch/screens/gt_users.dart';
import 'package:git_touch/screens/login.dart';
import 'package:git_touch/screens/settings.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => Home(),
      routes: [
        // common
        GoRoute(
          path: 'choose-code-theme',
          builder: (context, state) => CodeThemeScreen(),
        ),
        GoRoute(
          path: 'login',
          builder: (context, state) => LoginScreen(),
        ),
        GoRoute(
          path: 'settings',
          builder: (context, state) => SettingsScreen(),
          routes: [
            GoRoute(
              path: 'github-meta',
              builder: (context, state) => const GhMetaScreen(),
            ),
          ],
        ),

        // github
        GoRoute(
          path: 'github',
          builder: (context, state) => Home(),
          routes: [
            GoRoute(
              path: ':login',
              builder: (context, state) {
                final login = state.params['login']!;
                final tab = state.queryParams['tab'];
                switch (tab) {
                  case 'followers':
                    return GhFollowers(login);
                  case 'following':
                    return GhFollowing(login);
                  case 'people':
                    return GhMembers(login);
                  case 'stars':
                    return GhStars(login);
                  case 'repositories':
                    return GhRepos(login);
                  case 'organizations':
                    return GhOrgs(login);
                  case 'gists':
                    return GhGistsScreen(login);
                  case 'events':
                    return GhEventsScreen(login);
                  default:
                    return GhUserScreen(login);
                }
              },
              routes: [
                GoRoute(
                  path: 'gists/:id',
                  builder: (context, state) => GhGistsFilesScreen(
                    state.params['login']!,
                    state.params['id']!,
                  ),
                  routes: [
                    GoRoute(
                      path: ':file',
                      builder: (context, state) => GistObjectScreen(
                        state.params['login']!,
                        state.params['id']!,
                        state.params['file']!,
                        content: state.queryParams['content'],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            GoRoute(
              path: ':owner/:name',
              builder: (context, state) {
                return GhRepoScreen(
                  state.params['owner']!,
                  state.params['name']!,
                  branch: state.queryParams['ref'],
                );
              },
              routes: [
                GoRoute(
                  path: 'stargazers',
                  builder: (context, state) => GhStargazers(
                    state.params['owner']!,
                    state.params['name']!,
                  ),
                ),
                GoRoute(
                  path: 'watchers',
                  builder: (context, state) =>
                      GhWatchers(state.params['owner']!, state.params['name']!),
                ),
                GoRoute(
                  path: 'contributors',
                  builder: (context, state) => GhContributorsScreen(
                    state.params['owner']!,
                    state.params['name']!,
                  ),
                ),
                GoRoute(
                  path: 'releases',
                  builder: (context, state) => GhReleasesScreen(
                    state.params['owner']!,
                    state.params['name']!,
                  ),
                ),
                GoRoute(
                  path: 'commits/:branch',
                  builder: (context, state) => GhCommits(
                    state.params['owner']!,
                    state.params['name']!,
                    branch: state.params['branch'],
                  ),
                ),
                GoRoute(
                  path: 'commit/:sha',
                  builder: (context, state) => GhCommit(
                    state.params['owner']!,
                    state.params['name']!,
                    state.params['sha']!,
                  ),
                ),
                GoRoute(
                  path: 'compare/:before/:head',
                  builder: (context, state) => GhComparisonScreen(
                    state.params['owner']!,
                    state.params['name']!,
                    state.params['before']!,
                    state.params['head']!,
                  ),
                ),
                GoRoute(
                    path: 'blob/:ref',
                    builder: (context, state) => GhObjectScreen(
                          state.params['owner']!,
                          state.params['name']!,
                          state.params['ref']!,
                          path: state.queryParams['path'],
                          raw: state.queryParams['raw'],
                        )),
                GoRoute(
                  path: 'issues',
                  builder: (context, state) => GhIssuesScreen(
                    state.params['owner']!,
                    state.params['name']!,
                  ),
                  routes: [
                    GoRoute(
                      path: 'new',
                      builder: (context, state) => GhIssueFormScreen(
                        state.params['owner']!,
                        state.params['name']!,
                      ),
                    ),
                    GoRoute(
                      path: ':number',
                      builder: (context, state) => GhIssueScreen(
                        state.params['owner']!,
                        state.params['name']!,
                        int.parse(state.params['number']!),
                      ),
                    ),
                  ],
                ),
                GoRoute(
                  path: 'pulls',
                  builder: (context, state) => GhPullsScreen(
                    state.params['owner']!,
                    state.params['name']!,
                  ),
                ),
                GoRoute(
                  path: 'pull/:number',
                  builder: (context, state) => GhIssueScreen(
                    state.params['owner']!,
                    state.params['name']!,
                    int.parse(state.params['number']!),
                  ),
                  routes: [
                    GoRoute(
                      path: 'files',
                      builder: (context, state) {
                        return GhFilesScreen(
                          state.params['owner']!,
                          state.params['name']!,
                          int.parse(state.params['number']!),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        // gitlab
        GoRoute(
          path: 'gitlab',
          builder: (context, state) => Home(),
          routes: [
            GoRoute(
              path: 'user/:id',
              builder: (context, state) =>
                  GlUserScreen(int.parse(state.params['id']!)),
            ),
            GoRoute(
              path: 'group/:id',
              builder: (context, state) =>
                  GlGroupScreen(int.parse(state.params['id']!)),
            ),
            GoRoute(
              path: 'groups/:id/members',
              builder: (context, state) =>
                  GlMembersScreen(int.parse(state.params['id']!), 'groups'),
            ),
            GoRoute(
              path: 'projects/:id',
              builder: (context, state) => GlProjectScreen(
                int.parse(state.params['id']!),
                branch: state.queryParams['branch'],
              ),
              routes: [
                GoRoute(
                  path: 'starrers',
                  builder: (context, state) =>
                      GlStarrersScreen(int.parse(state.params['id']!)),
                ),
                GoRoute(
                  path: 'commits',
                  builder: (context, state) => GlCommitsScreen(
                    state.params['id']!,
                    prefix: state.queryParams['prefix'],
                    branch: state.queryParams['branch'],
                  ),
                ),
                GoRoute(
                  path: 'commit/:sha',
                  builder: (context, state) => GlCommitScreen(
                    state.params['id']!,
                    sha: state.params['sha']!,
                  ),
                ),
                GoRoute(
                  path: 'members',
                  builder: (context, state) => GlMembersScreen(
                      int.parse(state.params['id']!), 'projects'),
                ),
                GoRoute(
                  path: 'blob/:ref',
                  builder: (context, state) => GlBlobScreen(
                    int.parse(state.params['id']!),
                    state.params['ref']!,
                    path: state.queryParams['path'],
                  ),
                ),
                GoRoute(
                  path: 'tree/:ref',
                  builder: (context, state) => GlTreeScreen(
                    int.parse(state.params['id']!),
                    state.params['ref']!,
                    path: state.queryParams['path'],
                  ),
                ),
                GoRoute(
                    path: 'issues',
                    builder: (context, state) => GlIssuesScreen(
                          state.params['id']!,
                          prefix: state.queryParams['prefix'],
                        ),
                    routes: [
                      GoRoute(
                        path: 'new',
                        builder: (context, state) => GlIssueFormScreen(
                          int.parse(state.params['id']!),
                        ),
                      ),
                      GoRoute(
                        path: ':iid',
                        builder: (context, state) => GlIssueScreen(
                          int.parse(state.params['id']!),
                          int.parse(state.params['iid']!),
                        ),
                      ),
                    ]),
                GoRoute(
                  path: 'merge_requests',
                  builder: (context, state) => GlMergeRequestsScreen(
                    state.params['id']!,
                    prefix: state.queryParams['prefix'],
                  ),
                ),
              ],
            )
          ],
        ),

        // gitea
        GoRoute(
          path: 'gitea',
          builder: (context, state) => Home(),
          routes: [
            GoRoute(
              path: 'status',
              builder: (context, state) => GtStatusScreen(),
            ),
            GoRoute(
              path: ':login',
              builder: (context, state) {
                final login = state.params['login']!;
                final tab = state.queryParams['tab'];
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
              },
            ),
            GoRoute(
              path: ':owner/:name',
              builder: (context, state) => GtRepoScreen(
                state.params['owner']!,
                state.params['name']!,
              ),
              routes: [
                GoRoute(
                  path: 'blob',
                  builder: (context, state) => GtObjectScreen(
                    state.params['owner']!,
                    state.params['name']!,
                    path: state.queryParams['path'],
                  ),
                ),
                GoRoute(
                  path: 'stargazers',
                  builder: (context, state) {
                    return GtUsersScreen.stargazers(
                      state.params['owner']!,
                      state.params['name']!,
                    );
                  },
                ),
                GoRoute(
                  path: 'watchers',
                  builder: (context, state) {
                    return GtUsersScreen.watchers(
                      state.params['owner']!,
                      state.params['name']!,
                    );
                  },
                ),
                GoRoute(
                  path: 'stargazers',
                  builder: (context, state) => GtUsersScreen.stargazers(
                    state.params['owner']!,
                    state.params['name']!,
                  ),
                ),
                GoRoute(
                  path: 'watchers',
                  builder: (context, state) => GtUsersScreen.watchers(
                    state.params['owner']!,
                    state.params['name']!,
                  ),
                ),
                GoRoute(
                  path: 'forks',
                  builder: (context, state) => GtReposScreen.forks(
                    state.params['owner']!,
                    state.params['name']!,
                  ),
                ),
                GoRoute(
                  path: 'commits',
                  builder: (context, state) => GtCommitsScreen(
                    state.params['owner']!,
                    state.params['name']!,
                  ),
                ),
                GoRoute(
                  path: 'pulls',
                  builder: (context, state) => GtIssuesScreen(
                    state.params['owner']!,
                    state.params['name']!,
                    isPr: true,
                  ),
                ),
                GoRoute(
                  path: 'issues',
                  builder: (context, state) => GtIssuesScreen(
                    state.params['owner']!,
                    state.params['name']!,
                  ),
                  routes: [
                    GoRoute(
                        path: ':number',
                        builder: (context, state) => GtIssueScreen(
                              state.params['owner']!,
                              state.params['name']!,
                              state.params['number']!,
                            ),
                        routes: [
                          GoRoute(
                            path: 'comment',
                            builder: (context, state) {
                              return GtIssueCommentScreen(
                                state.params['owner']!,
                                state.params['name']!,
                                state.params['number']!,
                                body: state.queryParams['body']!,
                                id: state.queryParams['id']!,
                              );
                            },
                          ),
                        ]),
                    GoRoute(
                      path: 'new',
                      builder: (context, state) => GtIssueFormScreen(
                        state.params['owner']!,
                        state.params['name']!,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),

        // bitbucket
        GoRoute(
          path: 'bitbucket',
          builder: (context, state) => Home(),
          routes: [
            GoRoute(
              path: ':login',
              builder: (context, state) => BbUserScreen(
                state.params['login']!,
                isTeam: state.queryParams['team']! == '1',
              ),
            ),
            GoRoute(
              path: ':owner/:name',
              builder: (context, state) => BbRepoScreen(
                state.params['owner']!,
                state.params['name']!,
                branch: state.params['branch'],
              ),
              routes: [
                GoRoute(
                  path: 'src/:ref',
                  builder: (context, state) => BbObjectScreen(
                    state.params['owner']!,
                    state.params['name']!,
                    state.params['ref']!,
                    path: state.queryParams['path'],
                  ),
                ),
                GoRoute(
                  path: 'commits/:ref',
                  builder: (context, state) => BbCommitsScreen(
                    state.params['owner']!,
                    state.params['name']!,
                    state.params['ref']!,
                  ),
                ),
                GoRoute(
                  path: 'issues',
                  builder: (context, state) => BbIssuesScreen(
                    state.params['owner']!,
                    state.params['name']!,
                  ),
                  routes: [
                    GoRoute(
                      path: 'new',
                      builder: (context, state) => BbIssueFormScreen(
                        state.params['owner']!,
                        state.params['name']!,
                      ),
                    ),
                    GoRoute(
                      path: ':number',
                      builder: (context, state) {
                        return BbIssueScreen(
                          state.params['owner']!,
                          state.params['name']!,
                          state.params['number']!,
                        );
                      },
                      routes: [
                        GoRoute(
                          path: 'comment',
                          builder: (context, state) {
                            return BbIssueCommentScreen(
                              state.params['owner']!,
                              state.params['name']!,
                              state.params['number']!,
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
                GoRoute(
                  path: 'pulls',
                  builder: (context, state) => BbPullsScreen(
                    state.params['owner']!,
                    state.params['name']!,
                  ),
                )
              ],
            ),
          ],
        ),

        // gitee
        GoRoute(
          path: 'gitee',
          builder: (context, state) => Home(),
          routes: [
            GoRoute(
              path: ':login',
              builder: (context, state) {
                final login = state.params['login']!;
                final tab = state.queryParams['tab'];
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
              },
            ),
            GoRoute(
              path: 'search',
              builder: (context, state) => GeSearchScreen(),
            ),
            GoRoute(
              path: ':owner/:name',
              builder: (context, state) => GeRepoScreen(
                state.params['owner']!,
                state.params['name']!,
                branch: state.queryParams['branch'],
              ),
              routes: [
                GoRoute(
                  path: 'stargazers',
                  builder: (context, state) => GeUsersScreen.stargazers(
                    state.params['owner']!,
                    state.params['name']!,
                  ),
                ),
                GoRoute(
                  path: 'watchers',
                  builder: (context, state) => GeUsersScreen.watchers(
                    state.params['owner']!,
                    state.params['name']!,
                  ),
                ),
                GoRoute(
                  path: 'forks',
                  builder: (context, state) => GeReposScreen.forks(
                    state.params['owner']!,
                    state.params['name']!,
                  ),
                ),
                GoRoute(
                  path: 'blob/:sha',
                  builder: (context, state) => GeBlobScreen(
                    state.params['owner']!,
                    state.params['name']!,
                    state.params['sha']!,
                    state.params['path']!,
                  ),
                ),
                GoRoute(
                  path: 'tree/:sha',
                  builder: (context, state) => GeTreeScreen(
                    state.params['owner']!,
                    state.params['name']!,
                    state.params['sha']!,
                  ),
                ),
                GoRoute(
                  path: 'contributors',
                  builder: (context, state) => GeContributorsScreen(
                    state.params['owner']!,
                    state.params['name']!,
                  ),
                ),
                GoRoute(
                  path: 'commits',
                  builder: (context, state) => GeCommitsScreen(
                    state.params['owner']!,
                    state.params['name']!,
                    branch: state.queryParams['branch'],
                  ),
                  routes: [
                    GoRoute(
                      path: ':sha',
                      builder: (context, state) => GeCommitScreen(
                        state.params['owner']!,
                        state.params['name']!,
                        state.params['sha']!,
                      ),
                    )
                  ],
                ),
                GoRoute(
                  path: 'issues',
                  builder: (context, state) => GeIssuesScreen(
                    state.params['owner']!,
                    state.params['name']!,
                  ),
                  routes: [
                    GoRoute(
                      path: 'new',
                      builder: (context, state) => GeIssueFormScreen(
                        state.params['owner']!,
                        state.params['name']!,
                      ),
                    ),
                    GoRoute(
                      path: ':number',
                      builder: (context, state) {
                        return GeIssueScreen(
                          state.params['owner']!,
                          state.params['name']!,
                          state.params['number']!,
                        );
                      },
                      routes: [
                        GoRoute(
                          path: 'comment',
                          builder: (context, state) {
                            return GeIssueCommentScreen(
                              state.params['owner']!,
                              state.params['name']!,
                              state.params['number']!,
                              isPr: true,
                              body: state.queryParams['body']!,
                              id: state.queryParams['id']!,
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
                GoRoute(
                  path: 'pulls',
                  builder: (context, state) => GePullsScreen(
                    state.params['owner']!,
                    state.params['name']!,
                    isPr: true,
                  ),
                  routes: [
                    GoRoute(
                      path: ':number',
                      builder: (context, state) {
                        return GeIssueScreen(
                          state.params['owner']!,
                          state.params['name']!,
                          state.params['number']!,
                          isPr: true,
                        );
                      },
                      routes: [
                        GoRoute(
                          path: 'comment',
                          builder: (context, state) {
                            return GeIssueCommentScreen(
                              state.params['owner']!,
                              state.params['name']!,
                              state.params['number']!,
                              isPr: true,
                              body: state.queryParams['body']!,
                              id: state.queryParams['id']!,
                            );
                          },
                        ),
                        GoRoute(
                          path: 'files',
                          builder: (context, state) {
                            return GeFilesScreen(
                              state.params['owner']!,
                              state.params['name']!,
                              state.params['number']!,
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),

        // gogs
        GoRoute(
          path: 'gogs',
          builder: (context, state) => Home(),
          routes: [
            GoRoute(
              path: ':login',
              builder: (context, state) {
                final login = state.params['login']!;
                final tab = state.queryParams['tab'];
                final isViewer = state.queryParams['isViewer'];
                switch (tab) {
                  case 'followers':
                    return GoUsersScreen.followers(login);
                  case 'following':
                    return GoUsersScreen.following(login);
                  case 'repositories':
                    return GoReposScreen(login,
                        isViewer: isViewer == 'true' ? true : true);
                  case 'organizations':
                    return GoOrgsScreen.ofUser(login,
                        isViewer: isViewer == 'true'
                            ? true
                            : true); // handle better?
                  default:
                    return GoUserScreen(login);
                }
              },
            ),
            GoRoute(
              path: ':owner/:name',
              builder: (context, state) => GoRepoScreen(
                state.params['owner']!,
                state.params['name']!,
                branch: state.queryParams['branch'],
              ),
              routes: [
                GoRoute(
                  path: 'blob',
                  builder: (context, state) => GoObjectScreen(
                    state.params['owner']!,
                    state.params['name']!,
                    path: state.params['path'],
                    ref: state.params['ref'],
                  ),
                ),
                GoRoute(
                  path: 'commits',
                  builder: (context, state) => GoCommitsScreen(
                    state.params['owner']!,
                    state.params['name']!,
                    branch: state.queryParams['ref'],
                  ),
                ),
                GoRoute(
                  path: 'issues',
                  builder: (context, state) => GoIssuesScreen(
                    state.params['owner']!,
                    state.params['name']!,
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
