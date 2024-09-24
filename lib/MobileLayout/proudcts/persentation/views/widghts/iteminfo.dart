import 'package:flutter/material.dart';
import 'package:uitraning/Core/AppStyles.dart';
import 'package:uitraning/Core/Appcolors.dart';
import 'package:uitraning/MobileLayout/Home/data/models/dialyoffer.dart';
import 'package:uitraning/MobileLayout/proudcts/domain/Models/productModelHive.dart';

class ItemInformation extends StatelessWidget {
  const ItemInformation({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          productModel.title,
          style: AppStyles.styleSemiBold20(context)
              .copyWith(color: AppColors.black),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          productModel.description,
          style: AppStyles.styleRegular14(context),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
       '50',
          style: AppStyles.styleMedium14(context)
              .copyWith(color: AppColors.boldGrey),
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '${productModel.price / 2}',
              style: AppStyles.styleMedium14(context).copyWith(
                  color: AppColors.boldGrey,
                  decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
    '${productModel.price}',
              style: AppStyles.styleMedium14(context),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              '${productModel.price / 3}'+ "%0ff",
              style: AppStyles.styleRegular12(context)
                  .copyWith(color: AppColors.red),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Text('${productModel.price}'),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Product Details',
          style: AppStyles.styleSemiBold14(context),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          productModel.category ?? '',
          style: AppStyles.styleRegular12(context),
        )
      ],
    );
  }
}
