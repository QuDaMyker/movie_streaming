import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ItemCreadits extends StatelessWidget {
  ItemCreadits({
    super.key,
    this.image,
    required this.role,
    required this.name,
  });
  final String? image;
  final String role;
  final String name;
  late double deviceHeight;
  late double deviceWidth;

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(right: deviceWidth * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          CircleAvatar(
            radius: 42,
            backgroundImage: CachedNetworkImageProvider(
                '${dotenv.env['TMDB_BASE_IMAGE_URL']}${image ?? 'https://mir-s3-cdn-cf.behance.net/projects/404/6acb57129337655.Y3JvcCw5MDAsNzAzLDAsOTg.jpg'}'),
          ),
          SizedBox(
            height: deviceHeight * 0.008,
          ),
          Text(
            role,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: deviceHeight * 0.008,
          ),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
