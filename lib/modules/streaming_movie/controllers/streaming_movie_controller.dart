import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StreamingMovieController extends GetxController {
  final int movieId;
  StreamingMovieController({
    required this.movieId,
  });
  late WebViewController webViewController;
  @override
  void onInit() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );
    //webViewController.loadRequest(Uri.parse('${dotenv.get('2Embed')}$movieId'));
    String url =
        '<html><body><iframe src="https://www.2embed.cc/embed/$movieId" width="100%" height="100%" frameborder="0" scrolling="no" allowfullscreen></iframe></body></html>';
    // webViewController
    //     .loadRequest(Uri.parse('https://www.2embed.cc/embed/572802'));

    webViewController
        .loadRequest(Uri.dataFromString(url, mimeType: 'text/html'));
    super.onInit();
  }
}
