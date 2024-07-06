import 'dart:ui';
import 'package:anime_wave/core/cubit/app_user/app_user_cubit.dart';
import 'package:anime_wave/core/theme/app_pallete.dart';
import 'package:anime_wave/features/anime/presentation/bloc/animebloc/anime_bloc.dart';
import 'package:anime_wave/features/anime/presentation/page/homepage.dart';
import 'package:anime_wave/features/favoriteList/presentation/bloc/favorite_bloc.dart';
import 'package:anime_wave/features/favoriteList/presentation/pages/favorite_list_page.dart';
import 'package:anime_wave/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:anime_wave/features/profile/presentation/page/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/cubit/app_user/app_user_state.dart';
import '../../../anime/presentation/page/category_page.dart';
import '../../../../int_dep.dart';

class NavigatorPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => NavigatorPage());

  NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> with AutomaticKeepAliveClientMixin<NavigatorPage> {
  int _selectedIndex = 0;

  late List<Widget> _pages;
  @override
  void initState() {
    final AppUserCubit _counter = BlocProvider.of<AppUserCubit>(context);

    _pages = [
      HomePage(),
      MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => serviceLocator<AnimeBloc>()),

          ],
          child: CategoryPage()),
      BlocProvider(
        create: (context) => serviceLocator<FavoriteBloc>(),
        child: FavoriteListPage(),
      ),
      BlocProvider(
        create: (context) => serviceLocator<ProfileBloc>(),
        child: ProfilePage(),
      ),
    ];


    print((_counter.state as AppUserLoggin).user.email);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:PageView(
        controller: pageController,
        onPageChanged: (index) {
          pageChanged(index);
        },
        children:_pages
      ),
      bottomNavigationBar:
          Container(
            width: double.infinity,

            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 30,
                  sigmaY: 30,
                ),
                child: Opacity(
                  opacity: 0.8,
                  child: BottomNavigationBar(
                    elevation: 0,
                    backgroundColor: AppPallete.transparent,
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.search_rounded),
                        label: 'Search',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.favorite),
                        label: 'Favorite',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Profile',
                      ),
                    ],
                    currentIndex: _selectedIndex, //New
                    onTap: _onItemTapped,
                  ),
                )
              ),
      ),
    ),


    );
  }
  void pageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      pageController.jumpToPage(_selectedIndex);


    });
  }
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  bool get wantKeepAlive => true;
}
