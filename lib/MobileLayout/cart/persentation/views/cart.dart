import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uitraning/Core/widghts/Button.dart';
import 'package:uitraning/MobileLayout/cart/data/datasource/local/cartLocalDataSource.dart';
import 'package:uitraning/MobileLayout/cart/data/datasource/remote/CartRemoteDataSorce.dart';
import 'package:uitraning/MobileLayout/cart/data/repo/cartrepoimpl.dart';
import 'package:uitraning/MobileLayout/cart/persentation/controller/cart_cubit.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(CartRepoImpl(
          cartRemoteDataSource: CartRemoteDataSourceImpl(),
          cartsLocalDataSource: CartsLocalDataSourceImpl())
        ..getCart()),
      child: Scaffold(
        body: Column(
          children: [
            CustomButton(
              title: 'title',
              height: 200,
              width: 200,
              titleStyle: TextStyle(color: Colors.red),
              backGroundcolor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
