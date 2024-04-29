import 'package:anime_wave/core/theme/app_theme.dart';
import 'package:anime_wave/features/anime/presentation/page/homepage.dart';
import 'package:anime_wave/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/cubit/app_user/app_user_cubit.dart';
import 'core/cubit/app_user/app_user_state.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'int_dep.dart';
import 'features/navigation/presentation/page/navigation_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await intDependcies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_)=> serviceLocator<AppUserCubit>()),

      BlocProvider(create: (_)=> serviceLocator<AuthBloc>()),],

    child:
     MyApp(),

  ));
}

class MyApp extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_)=> serviceLocator<AppUserCubit>()),

            BlocProvider(create: (_)=> serviceLocator<AuthBloc>()),],

          child:
           MyApp(),

        );
      });  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthIsUserLoggedInEvent());

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.Thememode,
      home: BlocBuilder<AppUserCubit,AppUserState>(

        builder: (context,state){
          if( state is AppUserLoggin){
            print("main builder");
            return BlocProvider.value(
              value:
              BlocProvider.of<AppUserCubit>(this.context),
              child: NavigatorPage(),
            );
          }
          else {
            return BlocProvider.value(
              value:
              BlocProvider.of<AppUserCubit>(this.context),
              child: LoginPage(),
            );
          }

        },
      )

    );
  }
}
