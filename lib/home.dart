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
import 'generated/l10n.dart';

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
    // return GlProjectScreen(32221);
    // return IssuesScreen('flutter', 'flutter', isPullRequest: true);
    // return IssueScreen('reactjs', 'rfcs', 29);
    // return IssueScreen('reactjs', 'rfcs', 68, isPullRequest: true);
    // return Image.asset('images/spinner.webp', width: 32, height: 32);
    // return GhRepoScreen('shreyas1599', 'test');
    final auth = Provider.of<AuthModel>(context);
    switch (auth.activeAccount.platform) {
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
            return GhUserScreen(null);
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
            return GtUserScreen(auth.activeAccount.login, isViewer: true);
        }
        break;
      case PlatformType.gitee:
        switch (index) {
          case 0:
            return GeSearchScreen();
          case 1:
            return GeUserScreen(auth.activeAccount.login, isViewer: true);
        }
        break;
    }
  }

  Widget _buildNotificationIcon(BuildContext context, bool isActive) {
    final theme = Provider.of<ThemeModel>(context);
    final iconData = Icons.notifications;
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

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    final auth = Provider.of<AuthModel>(context);

    if (auth.activeAccount == null) {
      return LoginScreen();
    }

    List<BottomNavigationBarItem> navigationItems;

    switch (auth.activeAccount.platform) {
      case PlatformType.github:
        navigationItems = [
          BottomNavigationBarItem(
              icon: Icon(Icons.rss_feed), label: S.of(context).news),
          BottomNavigationBarItem(
              icon: _buildNotificationIcon(context, false),
              activeIcon: _buildNotificationIcon(context, true),
              label: S.of(context).notification),
          BottomNavigationBarItem(
              icon: Icon(Icons.whatshot), label: S.of(context).trending),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: S.of(context).search),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              activeIcon: Icon(Icons.person),
              label: S.of(context).me),
        ];
        break;
      case PlatformType.gitlab:
        navigationItems = [
          BottomNavigationBarItem(
              icon: Icon(Icons.explore), label: S.of(context).explore),
          BottomNavigationBarItem(
              icon: Icon(Icons.group), label: S.of(context).groups),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: S.of(context).search),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: S.of(context).me),
        ];
        break;
      case PlatformType.bitbucket:
        navigationItems = [
          BottomNavigationBarItem(
              icon: Icon(Icons.explore), label: S.of(context).explore),
          BottomNavigationBarItem(
              icon: Icon(Icons.group), label: S.of(context).teams),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: S.of(context).me),
        ];
        break;
      case PlatformType.gitea:
        navigationItems = [
          BottomNavigationBarItem(
              icon: Icon(Icons.group), label: S.of(context).organizations),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: S.of(context).me),
        ];
        break;
      case PlatformType.gitee:
        navigationItems = [
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: S.of(context).search),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: S.of(context).me),
        ];
        break;
    }

    switch (theme.theme) {
      case AppThemeType.cupertino:
        return WillPopScope(
          onWillPop: () async {
            return !await getNavigatorKey(auth.activeTab)
                .currentState
                ?.maybePop();
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
