import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming/modules/streaming_movie/controllers/streaming_movie_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StreamingMovieScreen extends StatelessWidget {
  const StreamingMovieScreen({
    super.key,
    required this.movieId,
  });
  final int movieId;

  @override
  Widget build(BuildContext context) {
    final streamingMovieControler =
        Get.put(StreamingMovieController(movieId: movieId));
    return SafeArea(
        child: Scaffold(
      body: WebViewWidget(
        controller: streamingMovieControler.webViewController,
      ),
    ));
  }
}
