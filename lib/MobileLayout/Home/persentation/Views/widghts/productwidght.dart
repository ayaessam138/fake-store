import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:uitraning/Core/AppStyles.dart';
import 'package:uitraning/Core/Appcolors.dart';
import 'package:uitraning/MobileLayout/Home/data/models/dialyoffer.dart';
import 'package:uitraning/MobileLayout/proudcts/domain/Models/productModelHive.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*.08,
            child: Image.network(

              productModel.image ?? '',

            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                Text(
                  productModel.title,
                  style: AppStyles.styleMedium12(context),
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    productModel.description,
                    style: AppStyles.styleRegular10(context),
                    maxLines: null, // Allow unlimited lines
                    overflow: TextOverflow.ellipsis, // Overflow style
                  ),
                ),
                Text(
                  '${productModel.price}',
                  style: AppStyles.styleMedium12(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${productModel.price}',
                      style: AppStyles.styleMedium12(context).copyWith(
                          fontWeight: FontWeight.w300,
                          color: AppColors.lightGrey),
                    ),
                    Text(
                      '50',
                      style: AppStyles.styleRegular12(context)
                          .copyWith(color: Colors.red),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${productModel.price}',
                    ),
                    // Text('${offerModel.rating.rate ?? ''}'),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
