import 'package:edtech/common/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
            builder: EasyLoading.init(),
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
                primarySwatch: Colors.amber,
                appBarTheme: const AppBarTheme(
                    elevation: 0, backgroundColor: Colors.white)),
            // home: const ApplicationPage(),
            onGenerateRoute: AppPages.GenerateRouteSettings,
          ),
        ));
  }

  // 2:43 part 6

//   Thank you for your clarifications.
// You can follow these instructions: https://www.namecheap.com/support/knowledgebase/article.aspx/10038/31/how-to-configure-a-contact-form-with-us/#smtpwp

// And use these SMTP details:
// From Email - the email address you want to use to send all WordPress emails from
// From Name - the name that the emails will be sent from
// Mailer - choose Other
// SMTP Host - server183.web-hosting.com
// Encryption - TLS or SSL
// SMTP Port - 465 (SSL) or 587 (TLS)
// Auto TLS - if your server supports TLS encryption, you may enable this option
// Authentication - On
// SMTP Username - full email address
// SMTP Password - password for that email address
}
