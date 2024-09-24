import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:uitraning/Core/Appcolors.dart';

import 'package:uitraning/MobileLayout/Home/persentation/Views/home.dart';
import 'package:uitraning/MobileLayout/proudcts/persentation/Controller/proudcts_cubit.dart';
import 'package:uitraning/MobileLayout/proudcts/persentation/views/Proudcts.dart';
import 'package:uitraning/MobileLayout/search.dart';
import 'package:uitraning/MobileLayout/setting.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  int currentindex = 0;

  List<BottomNavigationBarItem> ITEMS = [
    BottomNavigationBarItem(
        label: 'Home', icon: Icon(Icons.home, color: AppColors.black)),
    BottomNavigationBarItem(
      label: 'Products',
      icon: Icon(Icons.add_shopping_cart_outlined, color: AppColors.black),
    ),

  ];


  List<String> apppartitle = ['Home', 'Products', ];
  void pagenavgation(int index) {
    currentindex = index;
    emit(LayoutInitial());
  }
}
