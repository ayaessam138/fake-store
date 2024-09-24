part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}
class GetAllCartSucess extends CartState {
  final  List<CartModel>cartList;

  GetAllCartSucess({required this.cartList});
}
class GetAllCartFail extends CartState {}
class GetPAllCartLoading extends CartState {}