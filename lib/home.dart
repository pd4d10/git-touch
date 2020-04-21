import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/notification.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/screens/bb_explore.dart';
import 'package:git_touch/screens/bb_teams.dart';
import 'package:git_touch/screens/bb_user.dart';
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

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
  // Created 5 different variables instead of a list as list doesn't work
  final GlobalKey<NavigatorState> tab1 = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> tab2 = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> tab3 = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> tab4 = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> tab5 = GlobalKey<NavigatorState>();
  final CupertinoTabController _controller = CupertinoTabController();

  int active = 0;
  bool firstLoad = false;
  
  @override 
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override 
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override 
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final auth = Provider.of<AuthModel>(context);
    final theme = Provider.of<ThemeModel>(context);
    switch(auth.activeAccount.platform) {
      case PlatformType.github:
        if(theme.startTabGh != active) {
          theme.setDefaultStartTabGh(active);
        }
        break;
      case PlatformType.gitlab: 
        if(theme.startTabGl != active) {
          theme.setDefaultStartTabGl(active);
        }
        break;
      case PlatformType.bitbucket:
        if(theme.defaultTabBb != active) {
          theme.setDefaultStartTabBb(active);
        }
        break;
      case PlatformType.gitea:
        if(theme.defaultTabGt != active) {
          theme.setDefaultStartTabGt(active);
        }
        break;
    }
    
    super.didChangeAppLifecycleState(state);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final theme = Provider.of<ThemeModel>(context);
    final auth = Provider.of<AuthModel>(context);
    if(auth.activeAccount != null) {
      if(!firstLoad) {
        switch(auth.activeAccount.platform) {
          case PlatformType.github:
            active = theme.startTabGh;
            _controller.index = theme.startTabGh;
            break;
          case PlatformType.gitlab:
            active = theme.startTabGl;
            _controller.index = theme.startTabGl;
            break;
          case PlatformType.bitbucket:
            active = theme.startTabBb;
            _controller.index = theme.startTabBb;
            break;
          case PlatformType.gitea:
            active = theme.startTabGt;
            _controller.index = theme.startTabGt;
            break;
        }
        firstLoad = true;
      }
    }
  }
  
  _buildScreen(int index) {
    // return GlProjectScreen(32221);
    // return IssuesScreen('flutter', 'flutter', isPullRequest: true);
    // return IssueScreen('reactjs', 'rfcs', 29);
    // return IssueScreen('reactjs', 'rfcs', 68, isPullRequest: true);
    // return Image.asset('images/spinner.webp', width: 32, height: 32);
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
            return GtUserScreen(null);
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

  List<BottomNavigationBarItem> get _navigationItems {
    switch (Provider.of<AuthModel>(context).activeAccount.platform) {
      case PlatformType.github:
        return [
          BottomNavigationBarItem(
            icon: Icon(Icons.rss_feed),
            title: Text('News'),
          ),
          BottomNavigationBarItem(
            icon: _buildNotificationIcon(context, false),
            activeIcon: _buildNotificationIcon(context, true),
            title: Text('Notification'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            title: Text('Trending'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            activeIcon: Icon(Icons.person),
            title: Text('Me'),
          ),
        ];
      case PlatformType.gitlab:
        return [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            title: Text('Explore'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            title: Text('Groups'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Me'),
          ),
        ];
      case PlatformType.bitbucket:
        return [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            title: Text('Explore'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            title: Text('Teams'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Me'),
          ),
        ];
      case PlatformType.gitea:
        return [
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            title: Text('Organizations'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Me'),
          ),
        ];
    }
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

    switch (theme.theme) {
      case AppThemeType.cupertino:
        return WillPopScope(
            onWillPop: () async {
              return !await getNavigatorKey(_controller.index)
                  .currentState
                  .maybePop();
            },
            child: CupertinoTabScaffold(
                controller: _controller,
                tabBuilder: (context, index) {
                  return CupertinoTabView(
                      navigatorKey: getNavigatorKey(index),
                      builder: (context) {
                        return _buildScreen(index);
                      });
                },
                tabBar: CupertinoTabBar(
                    items: _navigationItems,
                    currentIndex: _controller.index,
                    onTap: (index) {
                      if (active == index) {
                        getNavigatorKey(index)
                            .currentState
                            .popUntil((route) => route.isFirst);
                      }
                      active = index;
                    })));
      default:
        return Scaffold(
          body: _buildScreen(active),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: theme.palette.primary,
            items: _navigationItems,
            currentIndex: active,
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              setState(() {
                active = index;
              });
            },
          ),
        );
    }
  }
}
