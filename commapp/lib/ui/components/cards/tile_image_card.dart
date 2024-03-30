import 'package:cached_network_image/cached_network_image.dart';
import 'package:commapp/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

class TileImageCard extends StatelessWidget {
  const TileImageCard({Key? key, required this.image}) : super(key: key);
  final String? image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
          bottomLeft: Radius.circular(4), //Same with the card
        ),
        child: CachedNetworkImage(
            imageUrl: image ?? ApplicationConstants.dummyImage),
      ),
    );
  }
}