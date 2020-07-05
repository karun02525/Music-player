import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:music_app/pages/splash_page.dart';
import 'package:music_app/provider/play_list_model.dart';
import 'package:music_app/provider/play_songs_model.dart';
import 'package:music_app/provider/user_model.dart';
import 'package:music_app/route/navigate_service.dart';
import 'package:music_app/route/routes.dart';
import 'package:music_app/utils/net_utils.dart';
import 'package:provider/provider.dart';

import 'application.dart';
import 'utils/log_util.dart';

void main() {
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;
  Application.setupLocator();
  LogUtil.init(tag: 'NETEASE_MUSIC');
//  AudioPlayer.logEnabled = true;
  Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UserModel>(
        create: (_) => UserModel(),
      ),
      ChangeNotifierProvider<PlaySongsModel>(
        create: (_) => PlaySongsModel()..init(),
      ),
      ChangeNotifierProvider<PlayListModel>(
        create: (_) => PlayListModel(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      navigatorKey: Application.getIt<NavigateService>().key,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          splashColor: Colors.transparent,
          tooltipTheme: TooltipThemeData(verticalOffset: -100000)),
      home: SplashPage(),
      onGenerateRoute: Application.router.generator,
    );
  }
}
