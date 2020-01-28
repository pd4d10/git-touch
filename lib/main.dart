import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/app.dart';
import 'package:git_touch/models/code.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/screens/about.dart';
import 'package:git_touch/screens/code_theme.dart';
import 'package:git_touch/screens/commits.dart';
import 'package:git_touch/screens/gitlab_blob.dart';
import 'package:git_touch/screens/gitlab_commits.dart';
import 'package:git_touch/screens/gitlab_issue.dart';
import 'package:git_touch/screens/gitlab_issues.dart';
import 'package:git_touch/screens/gitlab_project.dart';
import 'package:git_touch/screens/gitlab_tree.dart';
import 'package:git_touch/screens/gitlab_user.dart';
import 'package:git_touch/screens/issue_form.dart';
import 'package:git_touch/screens/issues.dart';
import 'package:git_touch/screens/object.dart';
import 'package:git_touch/screens/pulls.dart';
import 'package:git_touch/screens/repository.dart';
import 'package:git_touch/screens/settings.dart';
import 'package:git_touch/screens/stargazers.dart';
import 'package:git_touch/screens/user.dart';
import 'package:git_touch/screens/watchers.dart';
import 'package:git_touch/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/notification.dart';
import 'package:fluro/fluro.dart';
import 'package:git_touch/screens/login.dart';
import 'package:git_touch/screens/issue.dart';
import 'package:fimber/fimber.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Platform messages may fail, so we use a try/catch PlatformException.

  // try {
  //   String initialLink = await getInitialLink();
  //   Fimber.d(initialLink);
  // } on PlatformException {
  //   Fimber.d('test');
  // }

  // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  // AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  // Fimber.d('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"

  // IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  // Fimber.d('Running on ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"

  // TODO: Later, should check to enable debug log in debug build only
  Fimber.plantTree(DebugTree());

  final notificationModel = NotificationModel();
  final themeModel = ThemeModel();
  final authModel = AuthModel();
  final codeModel = CodeModel();
  await Future.wait([
    themeModel.init(),
    authModel.init(),
    codeModel.init(),
  ]);

  final List<RouterScreen> routers = [
    codeThemeRouter,
    aboutRouter,
    gitlabUserRouter,
    gitlabBlobRouter,
    gitlabTreeRouter,
    gitlabProjectRouter,
    gitlabIssueRouter,
    gitlabIssuesRouter,
    gitlabCommitsRouter,
    loginRouter,
    settingsRouter,
    userRouter,
    repositoryRouter,
    issueAddRouter,
    issuesRouter,
    pullsRouter,
    issueRouter,
    pullRouter,
    commitsRouter,
    objectRouter,
    stargazersRouter,
    watchersRouter,
  ];

  routers.forEach((screen) {
    themeModel.router
        .define(screen.path, handler: Handler(handlerFunc: screen.handler));
  });

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => notificationModel),
      ChangeNotifierProvider(create: (context) => themeModel),
      ChangeNotifierProvider(create: (context) => authModel),
      ChangeNotifierProvider(create: (context) => codeModel),
    ],
    child: MyApp(),
  ));
}
