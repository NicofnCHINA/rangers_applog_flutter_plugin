import 'package:flutter/material.dart';
import 'package:rangers_applog_flutter_plugin/autotrack.dart';

import 'home.dart';
import 'page2.dart';
import 'page3.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    RangersApplogAutoTrack().config(RangersApplogAutoTrackConfig(
      pageConfigs: [
        RangersApplogAutoTrackPageConfig<Home>(
          pageID: 'home-id',
          pagePath: '/home-custom',
          ignore: false,
        ),
        RangersApplogAutoTrackPageConfig<Page2>(
          pageID: 'page2-id',
        ),
        RangersApplogAutoTrackPageConfig<Page3>(
          pageID: 'page3-id',
        ),
      ],
      ignoreElementKeys: [],
    )).disablePageView().enable().enableLog();

    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: RangersApplogNavigationObserver.wrap([]),
      initialRoute: '/',
      routes: {
        '/': ((context) => Home()),
        '/page2': ((context) => Page2()),
        '/page3': ((context) => Page3()),
      },
    );
  }
}
