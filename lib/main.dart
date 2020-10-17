import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:git_touch/app.dart';
import 'package:git_touch/models/code.dart';
import 'package:git_touch/models/auth.dart';
import 'package:git_touch/models/theme.dart';
import 'package:git_touch/router.dart';
import 'package:provider/provider.dart';
import 'package:git_touch/models/notification.dart';
import 'package:fluro/fluro.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/services.dart';

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

  CommonRouter.routes.forEach((screen) {
    themeModel.router.define(CommonRouter.prefix + screen.path,
        handler: Handler(handlerFunc: screen.handler));
  });
  GitlabRouter.routes.forEach((screen) {
    themeModel.router.define(GitlabRouter.prefix + screen.path,
        handler: Handler(handlerFunc: screen.handler));
  });
  GiteaRouter.routes.forEach((screen) {
    themeModel.router.define(GiteaRouter.prefix + screen.path,
        handler: Handler(handlerFunc: screen.handler));
  });
  BitbucketRouter.routes.forEach((screen) {
    themeModel.router.define(BitbucketRouter.prefix + screen.path,
        handler: Handler(handlerFunc: screen.handler));
  });
  GithubRouter.routes.forEach((screen) {
    themeModel.router.define(GithubRouter.prefix + screen.path,
        handler: Handler(handlerFunc: screen.handler));
  });
  GiteeRouter.routes.forEach((screen) {
    themeModel.router.define(GiteeRouter.prefix + screen.path,
        handler: Handler(handlerFunc: screen.handler));
  });

  // To match status bar color to app bar color
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

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
