import 'package:url_launcher/url_launcher.dart';

class LiveStream {
  final youtubeURL =
      "https://www.youtube.com/embed/live_stream?channel=UC6qjNu84xNJXte6jGW3Or-g";

  void launchLivestreamYoutube() async {
    if (await canLaunch(youtubeURL)) {
      await launch(youtubeURL);
    } else {
      throw 'Could not launch $youtubeURL';
    }
  }

  void launchLiveStreamFacebook() {}

  void launchLivestreamChurchOnline() {}
}
