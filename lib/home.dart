import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/notification.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/screens/bb_explore.dart';
import 'package:git_touch/screens/bb_teams.dart';
import 'package:git_touch/screens/bb_user.dart';
import 'package:git_touch/screens/ge_user.dart';
import 'package:git_touch/screens/gl_search.dart';
import 'package:git_touch/screens/go_search.dart';
import 'package:git_touch/screens/go_user.dart';
import 'package:git_touch/screens/gt_orgs.dart';
import 'package:git_touch/screens/gt_user.dart';
import 'package:git_touch/screens/gl_explore.dart';
import 'package:git_touch/screens/gl_groups.dart';
import 'package:git_touch/screens/gl_user.dart';
import 'package:git_touch/screens/login.dart';
import 'package:git_touch/screens/gh_notification.dart';
import 'package:git_touch/screens/gh_user.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/screens/gh_news.dart';
import 'package:git_touch/screens/gh_search.dart';
import 'package:git_touch/screens/gh_trending.dart';
import 'package:git_touch/screens/ge_search.dart';
import 'package:flutter_gen/gen_l10n/S.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Created 5 different variables instead of a list as list doesn't work
  final GlobalKey<NavigatorState> tab1 = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> tab2 = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> tab3 = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> tab4 = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> tab5 = GlobalKey<NavigatorState>();

  _buildScreen(int index) {
    // print(Localizations.localeOf(context).toString());
    // return GlProjectScreen(32221);
    // return GhIssuesScreen('flutter', 'flutter', isPullRequest: true);
    // return GhIssueScreen('reactjs', 'rfcs', 29);
    // return GhIssueScreen('reactjs', 'rfcs', 68);
    // return Image.asset('images/spinner.webp', width: 32, height: 32);
    // return GhRepoScreen('shreyas1599', 'test');
    final auth = Provider.of<AuthModel>(context);
    switch (auth.activeAccount!.platform) {
      case PlatformType.github:
        switch (index) {
          case 0:
            return GhNewsScreen();
          case 1:
            return GhNotificationScreen();
          case 2:
            return GhTrendingScreen();
          case 3:
            return GhSearchScreen();
          case 4:
            return GhViewer();
        }
        break;
      case PlatformType.gitlab:
        switch (index) {
          case 0:
            return GlExploreScreen();
          case 1:
            return GlGroupsScreenn();
          case 2:
            return GlSearchScreen();
          case 3:
            return GlUserScreen(null);
        }
        break;
      case PlatformType.bitbucket:
        switch (index) {
          case 0:
            return BbExploreScreen();
          case 1:
            return BbTeamsScreen();
          case 2:
            return BbUserScreen(null);
        }
        break;
      case PlatformType.gitea:
        switch (index) {
          case 0:
            return GtOrgsScreen();
          case 1:
            return GtUserScreen(auth.activeAccount!.login, isViewer: true);
        }
        break;
      case PlatformType.gitee:
        switch (index) {
          case 0:
            return GeSearchScreen();
          case 1:
            return GeUserScreen(auth.activeAccount!.login, isViewer: true);
        }
        break;
      case PlatformType.gogs:
        switch (index) {
          case 0:
            return GoSearchScreen();
          case 1:
            return GoUserScreen(auth.activeAccount!.login, isViewer: true);
        }
    }
  }

  Widget _buildNotificationIcon(BuildContext context, IconData iconData) {
    final theme = Provider.of<ThemeModel>(context);
    int count = Provider.of<NotificationModel>(context).count;
    if (count == 0) {
      return Icon(iconData);
    }

    // String text = count > 99 ? '99+' : count.toString();
    return Stack(
      children: <Widget>[
        Icon(iconData),
        Positioned(
            right: -2,
            top: -2,
            child: Icon(Octicons.primitive_dot,
                color: theme.palette.primary, size: 14))
      ],
    );
  }

  GlobalKey<NavigatorState> getNavigatorKey(int index) {
    switch (index) {
      case 0:
        return tab1;
      case 1:
        return tab2;
      case 2:
        return tab3;
      case 3:
        return tab4;
      case 4:
        return tab5;
    }
    return tab1;
  }

  List<BottomNavigationBarItem> _buildNavigationItems(String platform) {
    final search = BottomNavigationBarItem(
      icon: Icon(Ionicons.search_outline),
      activeIcon: Icon(Ionicons.search),
      label: AppLocalizations.of(context)!.search,
    );
    final group = BottomNavigationBarItem(
      icon: Icon(Ionicons.people_outline),
      activeIcon: Icon(Ionicons.people),
      label: AppLocalizations.of(context)!.organizations,
    );
    final me = BottomNavigationBarItem(
      icon: Icon(Ionicons.person_outline),
      activeIcon: Icon(Ionicons.person),
      label: AppLocalizations.of(context)!.me,
    );
    final explore = BottomNavigationBarItem(
      icon: Icon(Ionicons.compass_outline),
      activeIcon: Icon(Ionicons.compass),
      label: AppLocalizations.of(context)!.explore,
    );

    switch (platform) {
      case PlatformType.github:
        return [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.newspaper_outline),
            activeIcon: Icon(Ionicons.newspaper),
            label: AppLocalizations.of(context)!.news,
          ),
          BottomNavigationBarItem(
            icon:
                _buildNotificationIcon(context, Ionicons.notifications_outline),
            activeIcon: _buildNotificationIcon(context, Ionicons.notifications),
            label: AppLocalizations.of(context)!.notification,
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.flame_outline),
            activeIcon: Icon(Ionicons.flame),
            label: AppLocalizations.of(context)!.trending,
          ),
          search,
          me,
        ];
        break;
      case PlatformType.gitlab:
        return [explore, group, search, me];
        break;
      case PlatformType.bitbucket:
        return [explore, group, me];
        break;
      case PlatformType.gitea:
        return [group, me];
        break;
      case PlatformType.gitee:
      case PlatformType.gogs:
        return [search, me];
        break;
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    final auth = Provider.of<AuthModel>(context);

    if (auth.activeAccount == null) {
      return LoginScreen();
    }

    final navigationItems = _buildNavigationItems(auth.activeAccount!.platform);

    switch (theme.theme) {
      case AppThemeType.cupertino:
        return WillPopScope(
          onWillPop: () async {
            return !(await getNavigatorKey(auth.activeTab)
                .currentState
                ?.maybePop())!;
          },
          child: CupertinoTabScaffold(
            tabBuilder: (context, index) {
              return CupertinoTabView(
                navigatorKey: getNavigatorKey(index),
                builder: (context) {
                  return _buildScreen(index);
                },
              );
            },
            tabBar: CupertinoTabBar(
              items: navigationItems,
              currentIndex: auth.activeTab,
              onTap: (index) {
                if (auth.activeTab == index) {
                  getNavigatorKey(index)
                      .currentState
                      ?.popUntil((route) => route.isFirst);
                } else {
                  auth.setActiveTab(index);
                }
              },
            ),
          ),
        );
      default:
        return Scaffold(
          body: IndexedStack(
            index: auth.activeTab,
            children: [
              for (var i = 0; i < navigationItems.length; i++) _buildScreen(i)
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: theme.palette.primary,
            items: navigationItems,
            currentIndex: auth.activeTab,
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              auth.setActiveTab(index);
            },
          ),
        );
    }
  }
}
