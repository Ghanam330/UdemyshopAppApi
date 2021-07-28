import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_api_udemy/cubit/cubit.dart';
import 'package:shop_app_api_udemy/styles/thems.dart';
import 'Screen/on_boarding/on_boarding_screen.dart';
import 'cubit/states.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ShopCubit(),
        child: BlocConsumer<ShopCubit,ShopStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'SalaaMarket',
              theme:lightThem ,
              // darkTheme:darkThem,
              // themeMode: AppCubit.get(context).isDark ? ThemeMode.dark: ThemeMode.light ,
              home: Directionality(
                  textDirection: TextDirection.ltr,
                  child: OnBoardingScreen()),
            );
          },
        )
    );
  }
}
