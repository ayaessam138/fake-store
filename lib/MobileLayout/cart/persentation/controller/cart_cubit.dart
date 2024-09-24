import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uitraning/MobileLayout/cart/data/models/cartModel.dart';
import 'package:uitraning/MobileLayout/cart/domain/cartRepo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.repo) : super(CartInitial());

  final CartRepo repo;
  var result;

  Future<void> getAllCart() async {
    print('getAllCart...');

    emit(GetPAllCartLoading());
    result = await repo.getCart();
    result.fold(
            (l) => emit(GetAllCartFail()),
            (r) => emit(GetAllCartSucess(cartList: r))
    );
  }

}
