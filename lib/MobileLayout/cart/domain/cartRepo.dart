import 'package:dartz/dartz.dart';
import 'package:uitraning/Core/failure.dart';
import 'package:uitraning/MobileLayout/cart/data/models/cartModel.dart';

abstract class CartRepo{
  Future<Either<Failure, List<CartModel>>> getCart();}