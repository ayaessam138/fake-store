import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uitraning/MobileLayout/proudcts/data/repos/productRepoImpl.dart';
import 'package:uitraning/MobileLayout/proudcts/domain/Models/productModelHive.dart';
import 'package:uitraning/MobileLayout/proudcts/domain/repos/ProudctsRepo.dart';

part 'proudcts_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.repo) : super(ProudctsInitial());

final ProductsRepo repo;
  var result;
  List<ProductModel>productsList=[];
  Future<void> getAllProducts() async {
    print('Fetching products...');
    emit(GetAllProductsLoading());
    result = await repo.getAllProducts();
    result.fold(
            (l) => emit(GetAllProductsFail()),
            (r) {
              productsList=r;
              emit(GetAllProductsSucess(products: r));
            }
    );
  }
  Future<void> getProductById({required int id}) async {
    print('getProductById...');
    emit(GetAllProductByIdLoading());
    result = await repo.getProductById(id: id);
    result.fold(
            (l) => emit(GetAllProductByIdFail()),
            (r) => emit(GetAllProductByIdSucess(product: r))
    );
  }
}
