import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uitraning/Core/layout_cubit.dart';
import 'package:uitraning/MobileLayout/Home/persentation/Views/home.dart';
import 'package:uitraning/MobileLayout/cart/persentation/views/cart.dart';

import 'package:uitraning/MobileLayout/proudcts/persentation/Controller/proudcts_cubit.dart';
import 'package:uitraning/MobileLayout/proudcts/persentation/views/Proudcts.dart';
import 'package:uitraning/MobileLayout/search.dart';
import 'package:uitraning/MobileLayout/setting.dart';

class AppLayout extends StatelessWidget {
  static String AppLayoutid = 'AppLayout';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          List<Widget> Screens = [Home(), Products(),Cart(), Search(), Setting()];
          return Scaffold(
              body: Screens[BlocProvider.of<LayoutCubit>(context).currentindex],
              bottomNavigationBar: BottomNavigationBar(
                // backgroundColor: AppColors.white,
                showSelectedLabels: true,
                // selectedItemColor: AppColors.white,
                selectedLabelStyle: TextStyle(color: Colors.black),
                currentIndex:
                    BlocProvider.of<LayoutCubit>(context).currentindex,
                items: BlocProvider.of<LayoutCubit>(context).ITEMS,
                onTap: (index) {
                  BlocProvider.of<LayoutCubit>(context).pagenavgation(index);
                },
              ));
        },
      ),
    );
  }
}
