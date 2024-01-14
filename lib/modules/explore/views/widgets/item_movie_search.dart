import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ItemMovieSearch extends StatelessWidget {
  const ItemMovieSearch({
    super.key,
    required this.height,
    required this.width,
    required this.data,
  });
  final double height;
  final double width;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: height * 0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          _moviePosterWidget(
            data['profile_path'] ??
                data['backdrop_path'] ??
                data['poster_path'] ??
                data['logo_path'] ??
                'no-data',
          ),
          SizedBox(width: width * 0.02),
          _movieInfoWidget(),
        ],
      ),
    );
  }

  Widget _moviePosterWidget(String imageUrl) {
    return Container(
      height: height,
      width: width * 0.3,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            imageUrl == 'no-data'
                ? 'https://images.unsplash.com/photo-1535016120720-40c646be5580?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
                : '${dotenv.env['TMDB_BASE_IMAGE_URL']}$imageUrl',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _movieInfoWidget() {
    return SizedBox(
      height: height,
      width: width * 0.55,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width * 0.49,
                    child: Text(
                      data['original_title'] ??
                          data['original_name'] ??
                          data['origin_country'] ??
                          'not updated',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 18,
                ),
                SizedBox(
                  width: width * 0.4,
                  child: Text(
                    (data['known_for'] != null &&
                            data['known_for'].isNotEmpty &&
                            data['known_for'][0]['vote_average'] != null)
                        ? data['known_for'][0]['vote_average'].toString()
                        : data['vote_average'].toString() ??
                            data['name'] ??
                            'not updated',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, height * 0.02, 0, 0),
              child: Text(
                '${(data['known_for'] != null && data['known_for'].isNotEmpty && data['known_for'][0]['original_language'] != null) ? data['known_for'][0]['original_language'] : (data['original_language'] ?? 'not updated')} | R: ${data['adult'] ?? 'not updated'} | ${data['release_date'] ?? 'not updated'}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, height * 0.07, 0, 0),
              child: Text(
                data['overview'] ?? 'not updated',
                maxLines: 9,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
