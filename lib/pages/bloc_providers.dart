import 'package:edtech/pages/register/blocs/register_blocs.dart';
import 'package:edtech/pages/sign%20in/bloc/signin_bloc.dart';
import 'package:edtech/pages/welcome/bloc/welcom_block.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(lazy: false, create: (context) => WelcomeBloc()),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
      ];
}
