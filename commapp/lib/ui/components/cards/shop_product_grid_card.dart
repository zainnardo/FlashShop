import 'package:cached_network_image/cached_network_image.dart';
import 'package:commapp/core/constants/app_constants.dart';
import 'package:commapp/core/extensions/context_extensions.dart';
import 'package:commapp/core/extensions/string_case_extension.dart';
import 'package:commapp/models/product_model.dart';
import 'package:commapp/ui/components/product_rating_bar.dart';
import 'package:commapp/ui/view/product_detail_view.dart';

import 'package:flutter/material.dart';

class ShopProductGridCard extends StatelessWidget {
  const ShopProductGridCard({Key? key, required this.product})
      : super(key: key);
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetailView(
                    product: product,
                  ))),
      child: Container(
        color: context.colors.primary,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 120,
                    width: 100,
                    child: ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: CachedNetworkImage(
                        imageUrl:
                            product.image ?? ApplicationConstants.dummyImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ProductRatingBar(product: product),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    child: Text('${product.title}',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    child: Text(
                      '${product.category}'.toTitleCase(),
                      style: context.textTheme.bodySmall!.copyWith(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    child: Text(
                      '${product.price}\$',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}