
import 'package:commapp/core/extensions/context_extensions.dart';
import 'package:commapp/core/extensions/string_case_extension.dart';
import 'package:commapp/models/product_model.dart';
import 'package:commapp/ui/components/cards/tile_image_card.dart';
import 'package:commapp/ui/components/product_rating_bar.dart';
import 'package:commapp/ui/view/product_detail_view.dart';
import 'package:flutter/material.dart';

class ShopProductListCard extends StatelessWidget {
  const ShopProductListCard({Key? key, required this.product})
      : super(key: key);
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: Column(
        children: [
          InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetailView(
                          product: product,
                        ))),
            child: SizedBox(
              height: 160,
              child: Stack(
                children: [
                  Card(
                    color: context.colors.primary,
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Expanded(child: _buildImage()),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      child: Text('${product.title}',
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      child: Text(
                                        '${product.category}'.toTitleCase(),
                                        style: context.textTheme.bodySmall!
                                            .copyWith(),
                                      ),
                                    ),
                                    Padding(
                                      padding: context.paddingLowVertical,
                                      child: ProductRatingBar(product: product),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      child: Text(
                                        '${product.price}\$',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  TileImageCard _buildImage() => TileImageCard(image: product.image);
}