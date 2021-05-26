import 'package:yessoft/module_chat/chat_module.dart';
import 'package:yessoft/module_localization/service/localization_service/localization_service.dart';
import 'package:yessoft/module_theme/service/theme_service/theme_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:inject/inject.dart';

import 'di/components/app.component.dart';
import 'generated/l10n.dart';
import 'module_auth/authoriazation_module.dart';
import 'module_auth/authorization_routes.dart';
import 'module_settings/settings_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    final container = await AppComponent.create();
    runApp(container.app);
  });
}

@provide
class MyApp extends StatefulWidget {
  final AppThemeDataService _themeDataService;
  final LocalizationService _localizationService;
  final ChatModule _chatModule;
  final SettingsModule _settingsModule;
  final AuthorizationModule _authorizationModule;

  MyApp(
    this._themeDataService,
    this._localizationService,
    this._chatModule,
    this._settingsModule,
    this._authorizationModule,
  );

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  String lang;
  ThemeData activeTheme;
  bool authorized = false;

  @override
  void initState() {
    super.initState();
    widget._localizationService.localizationStream.listen((event) {
      setState(() {});
    });

    widget._themeDataService.darkModeStream.listen((event) {
      activeTheme = event;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var fullRoutesList = <String, WidgetBuilder>{};
    fullRoutesList.addAll(widget._authorizationModule.getRoutes());
    fullRoutesList.addAll(widget._chatModule.getRoutes());
    fullRoutesList.addAll(widget._settingsModule.getRoutes());

    // TODO: Plug your Module Here

    return FutureBuilder(
      initialData: ThemeData.light(),
      future: widget._themeDataService.getActiveTheme(),
      builder: (BuildContext context, AsyncSnapshot<ThemeData> themeSnapshot) {
        return FutureBuilder(
            initialData: 'en',
            future: widget._localizationService.getLanguage(),
            builder:
                (BuildContext context, AsyncSnapshot<String> langSnapshot) {
              return getConfiguratedApp(
                fullRoutesList,
                themeSnapshot.data,
                langSnapshot.data,
              );
            });
      },
    );
  }

  Widget getConfiguratedApp(
    Map<String, WidgetBuilder> fullRoutesList,
    ThemeData theme,
    String activeLanguage,
  ) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: <NavigatorObserver>[observer],
      locale: Locale.fromSubtags(
        languageCode: activeLanguage,
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: theme,
      supportedLocales: S.delegate.supportedLocales,
      // TODO: Change this!
      title: 'Yes Soft Boilerplate',
      routes: fullRoutesList,
      // TODO: Plug Home Page Here
      initialRoute: AuthorizationRoutes.AUTH_SCREEN,
    );
  }
}
