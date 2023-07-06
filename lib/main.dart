import 'package:edtech/common/routes/routes.dart';
import 'package:edtech/pages/application/application_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        // create: (context) => WelcomeBloc(),
        providers: [...AppPages.allBlocProviders(context)],
        //AppBlocProviders.allBlocProviders,
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
                primarySwatch: Colors.amber,
                appBarTheme: const AppBarTheme(
                    elevation: 0, backgroundColor: Colors.white)),
            onGenerateRoute: AppPages.GenerateRouteSettings,
            home: ApplicationPage(),
          ),
        ));
  }

  // 3:14 part 3
}
