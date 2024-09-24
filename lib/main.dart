import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uitraning/Core/Layout.dart';
import 'package:uitraning/Core/api/dio_helper.dart';
import 'package:uitraning/Core/constans.dart';
import 'package:uitraning/MobileLayout/ForgetPassword/forgetPassword.dart';
import 'package:uitraning/MobileLayout/Home/data/datasource/local/categoreylocalDataSource.dart';
import 'package:uitraning/MobileLayout/Home/data/datasource/local/productsIncategoreyDataSource.dart';
import 'package:uitraning/MobileLayout/Home/data/datasource/remote/categoreyremoteDataSource.dart';
import 'package:uitraning/MobileLayout/Home/data/datasource/remote/getLimitedProductsRemoteDataSource.dart';
import 'package:uitraning/MobileLayout/Home/data/datasource/remote/productsinCategoreyRemoteDataSource.dart';
import 'package:uitraning/MobileLayout/Home/data/repos/HomeRepoImpl.dart';
import 'package:uitraning/MobileLayout/Home/persentation/Views/home.dart';
import 'package:uitraning/MobileLayout/Home/persentation/Views/productsInCategorey.dart';
import 'package:uitraning/MobileLayout/Home/persentation/contrller/home_cubit.dart';
import 'package:uitraning/MobileLayout/Login/persentation/Views/Login.dart';
import 'package:uitraning/MobileLayout/SignUp/signUp.dart';
import 'package:uitraning/MobileLayout/Splash/persentation/Views/ScrollPage.dart';
import 'package:uitraning/MobileLayout/cart/data/datasource/local/cartLocalDataSource.dart';
import 'package:uitraning/MobileLayout/cart/data/datasource/remote/CartRemoteDataSorce.dart';
import 'package:uitraning/MobileLayout/cart/data/models/cartModel.dart';
import 'package:uitraning/MobileLayout/cart/data/repo/cartrepoimpl.dart';
import 'package:uitraning/MobileLayout/cart/persentation/controller/cart_cubit.dart';
import 'package:uitraning/MobileLayout/proudcts/data/dataSource/local/productlocaldatasource.dart';
import 'package:uitraning/MobileLayout/proudcts/data/dataSource/remote/productsremotedatasource.dart';
import 'package:uitraning/MobileLayout/proudcts/data/repos/productRepoImpl.dart';
import 'package:uitraning/MobileLayout/proudcts/domain/Models/productModelHive.dart';
import 'package:uitraning/MobileLayout/proudcts/persentation/Controller/proudcts_cubit.dart';
import 'package:uitraning/MobileLayout/proudcts/persentation/views/itemDeatils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  Hive.registerAdapter(CartModelAdapter());
  await Hive.openBox<CartModel>(cartBox);
  await Hive.openBox<ProductModel>(productBox);
  await Hive.openBox<String>(categoriesBox);
  await Hive.openBox<ProductModel>(productbyid);
  await Hive.openBox<ProductModel>(productsInCategoryBox);
  await DioHelper.init();

  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(
          create: (context) => HomeCubit(HomeRepoImpl(
              categoriesLocalDataSource: CategoriesLocalDataSourceImpl(),
              categoriesRemoteDataSource: CategoriesRemoteDataSourceImpl(),
              productsInCategoryRemoteDataSource:
                  ProductsInCategoryRemoteDataSourceImpl(),
              productsInCategoryLocalDataSource:
                  ProductsInCategoryLocalDataSourceImpl(),
              limitedProductsRemoteDataSource:
                  LimitedProductsRemoteDataSourceImpl()))
            ..getAllCategories()
            ..getLimitedProducts(number: 7),
        )
      ],
      child: MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => ScrollPage(),
          Login.Loginid: (context) => Login(),
          SignUp.SignUpid: (context) => SignUp(),
          ForgetPassword.ForgetPasswordid: (context) => ForgetPassword(),
          AppLayout.AppLayoutid: (context) => AppLayout(),
          Home.Homeid: (context) => Home(),
          ItemDeatils.ItemDeatilsid: (context) => ItemDeatils(),
          ProductsInCategory.productsInCategoryId: (context) =>
              ProductsInCategory()
        },
      ),
    );
  }
}
