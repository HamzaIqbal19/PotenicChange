import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:potenic_app/Notifier/GoalNotifier.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:potenic_app/Screen/splash/splash_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: Colors.transparent,
  ));
  Stripe.publishableKey =
      "pk_test_51MP8GqRkeqntfFwkc7SudCslwib67ICcq4Oot6G6MvZ0fm3Gra2eEADbWba05wnSFvEBozpb47Q3db0l0G8eiary006dzhKTBs";

  //Load our .env file that contains our Stripe Secret key
  await dotenv.load(fileName: "assets/.env");
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://591f2b424a6342c48fc692daed3d8bc3@o4504826441760768.ingest.sentry.io/4505311747702784';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(
      ChangeNotifierProvider(
        create: (context) => GoalProvider(),
        child: const MyApp(),
      ),
    ),
  );
  //runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool smallScreen = MediaQuery.of(context).size.height < 690;
    return ScreenUtilInit(
        designSize: const Size(360, 660),
        minTextAdapt: true,
        // splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            title: 'Potenic',
            theme: ThemeData(
                primarySwatch: Colors.grey,
                fontFamily: "Laila",
                useMaterial3: false),
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaleFactor: smallScreen ? 0.85 : 0.87),
                child: child!,
              );
            },
            home: const SplashPage(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
