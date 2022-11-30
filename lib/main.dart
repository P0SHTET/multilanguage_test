import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/loaders/decoders/json_decode_strategy.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class CustomNetworkFileTranslationLoader extends NetworkFileTranslationLoader {
  CustomNetworkFileTranslationLoader({required baseUri})
      : super(baseUri: baseUri, decodeStrategies: [JsonDecodeStrategy()]);
}

Future main() async {
  final FlutterI18nDelegate flutterI18nDelegate = FlutterI18nDelegate(
    translationLoader: CustomNetworkFileTranslationLoader(
      baseUri: Uri.https(
        "wicando.dev.thewhite.ru",
        "api/weblate-proxy-service/download/wicando/mobile",
      ),
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(flutterI18nDelegate));
}

class MyApp extends StatelessWidget {
  final FlutterI18nDelegate flutterI18nDelegate;

  MyApp(this.flutterI18nDelegate);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
      localizationsDelegates: [
        flutterI18nDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const <Locale>[
        Locale("en", "US"),
        Locale("ru", "RU"),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(FlutterI18n.translate(context, "main.welcome"))),
      body: Builder(builder: (BuildContext context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              I18nText(
                "hostError",
                child: Text(""),
              ),
              I18nText(
                "hostError",
                child: Text(""),
              ),
              I18nText(
                "hostError",
                child: Text(""),
              ),
              I18nText(
                "hostError",
                child: Text(""),
              ),
            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        if (FlutterI18n.currentLocale(context)?.languageCode == 'ru') {
          await FlutterI18n.refresh(context, Locale('en', 'US'));
        } else {
          await FlutterI18n.refresh(context, Locale('ru', 'RU'));
        }
        setState(() {});
      }),
    );
  }
}
